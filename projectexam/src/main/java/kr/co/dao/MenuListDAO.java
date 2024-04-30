package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.vo.MenuListVO;

public interface MenuListDAO {
	
	public int insert( MenuListVO vo);
	public int modify(MenuListVO vo);
	public int delOne(String menu_name);
	public int modify_menu_use(String menu_name);

	
	public List<HashMap<String, Object>> getMenuWithCategori(String categori_name);
	public List<HashMap<String, Object>> getMenuWithCategoriAndImage(String categori_name);

	public List<HashMap<String, Object>> getMenuWithImage();  //실험용
	public List<HashMap<String, Object>> getMenuPrice();
	public List<MenuListVO> getAll();
	public List<MenuListVO> getAllWithCategori(String categori_name);
	public MenuListVO getOne(String menu_name);
	public int getCount();
	public List<HashMap<String, Object>> getCategoryRecommendedMenu(@Param("categori_id") String categori_id, 
													@Param("recommendedMenuCount") int recommendedMenuCount,
													@Param("mem_ph_num") String mem_ph_num); // 추천메뉴 가져오기 위함
	
	
	
	
}
