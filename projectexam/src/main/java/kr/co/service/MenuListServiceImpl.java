package kr.co.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.CategoriDAO;
import kr.co.dao.MenuListDAO;
import kr.co.dao.OrderListDAO;
import kr.co.vo.MemberVO;
import kr.co.vo.MenuListVO;
@Service
public class MenuListServiceImpl implements MenuListService {
	
	@Autowired MenuListDAO menuListDAO;
	@Autowired CategoriDAO categoriDAO;
	@Autowired OrderListDAO orderListDAO;
	
	
	
	
	
	@Override
	public List<HashMap<String, Object>> getMenuPrice() {
		return menuListDAO.getMenuPrice();
	}

	@Override
	public List<HashMap<String, Object>> getMenuPriceWithCategoriName(String categori_name) {
		return menuListDAO.getMenuWithCategoriAndImage(categori_name);
	}

	@Override
	public int menuAdd(String categori_name, MenuListVO vo) {
		vo.setCategori_id(categoriDAO.getOne(categori_name).getCategori_id());
		return menuListDAO.insert(vo);
				
	}
	
	@Override
	public List<MenuListVO> getMenuForModify(String categori_name) {	
		return menuListDAO.getAllWithCategori(categori_name);
	}

	@Override
	public int menuModify(MenuListVO vo) {
		return menuListDAO.modify(vo);
	}

	@Override
	public int deleteMenu(String menu_name) {
		return menuListDAO.delOne(menu_name);
	}

	@Override
	public List<MenuListVO> getall() {
		List<MenuListVO> menuList = menuListDAO.getAll();
		return menuList;
	
	}

	@Override
	public List<HashMap<String, Object>> getWithImage() {
		return menuListDAO.getMenuWithImage();
	}
	@Override
	public List<HashMap<String, Object>> getRecommendedMenu( HttpSession session) {
        List<HashMap<String, Object>> recommendedMenu = new ArrayList<>();
        //세션아이디에서 폰 번호를 구해오기 
        String mem_ph_num;
        if(session.getAttribute("loginObj") !=null ) {
		    MemberVO vo = (MemberVO) session.getAttribute("loginObj");
		    mem_ph_num = vo.getMem_ph_num();
		    System.out.println("-----------vo---------->>"+vo);
        }else {
        	mem_ph_num = null;
        }
        // 카테고리별 판매 비율을 구하기 위한 쿼리 실행 --> 카테고리별 몇 개가 팔렸는지 확인
        List<HashMap<String,Object>> categorySalesRatio = orderListDAO.getCategorySalesRatio(mem_ph_num);
        //반환되는 내역이 없다면 null을 반환하도록
        if(categorySalesRatio.isEmpty()) { 
        	return null;
        }
        // 총 팔린 개수 구해오기
        int totalSalesCount = orderListDAO.getCountSaleRate(mem_ph_num);
        // 추천 메뉴 개수 설정 (예: 10개)
        int totalRecommendedMenuCount = 12;
        
        // 각 카테고리에서 추천 메뉴 선택
        for (HashMap<String, Object> row : categorySalesRatio) {
        	String categori_id = (String) row.get("CATEGORI_ID");
        	int salesCount = ((Number) row.get("SUM")).intValue();
            double salesRatio = (double)salesCount / totalSalesCount; // 전체 판매 중 해당 카테고리의 비율
            int recommendedMenuCount = (int) (totalRecommendedMenuCount * salesRatio);
            
            // 각 카테고리에서 추천 메뉴를 가져오는 쿼리 실행
        	List<HashMap<String, Object>> categoryRecommendedMenu = menuListDAO.getCategoryRecommendedMenu(categori_id, recommendedMenuCount,mem_ph_num);  

            // 전체 추천 메뉴 리스트에 추가
            recommendedMenu.addAll(categoryRecommendedMenu);
        }

        return recommendedMenu;
    }
	
	

	
	
}
