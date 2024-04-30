package kr.co.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.vo.MenuListVO;

public interface MenuListService {

	List<HashMap<String, Object>> getMenuPrice();

	List<HashMap<String, Object>> getMenuPriceWithCategoriName(String categori_name);
	
	int menuAdd(String categori_name,MenuListVO vo );

	List<MenuListVO> getMenuForModify(String categori_name);

	int menuModify(MenuListVO vo);

	int deleteMenu(String menu_name);

	List<MenuListVO> getall();
	
	List<HashMap<String, Object>> getWithImage();  //실험용
	
	List<HashMap<String, Object>> getRecommendedMenu( HttpSession session); //메뉴 추천을 뿌려주기 위해서
	
}
