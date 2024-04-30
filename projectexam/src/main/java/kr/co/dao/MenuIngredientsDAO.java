package kr.co.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.vo.MenuIngredientsVO;

public interface MenuIngredientsDAO {
	
	public int insert(@Param("menu_name") String menu_name,
			@Param("ingredient_name") String ingredient_name,
			@Param("use_ingredient") int use_ingredient);
	public int delMenu(String menu_name);
	
	public List<MenuIngredientsVO> getAll();
	public List<MenuIngredientsVO> getUseMenu(String menu_name);
	public List<MenuIngredientsVO> getUseCategori(String categori_name);
	public int getCount();
	
}
