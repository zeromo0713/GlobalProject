package kr.co.dao;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.vo.MenuListVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MenuListDAOTest {

	@Autowired MenuListDAO menuListDAO;
	@Autowired CategoriDAO categoriDAO;
	
	@Test
	public void daoTest() {
		assertNotNull(menuListDAO);
	}
	@Test
	public void getAllTest() {
		menuListDAO.getAll();
	}
	@Test
	public void getOneTest() {
		menuListDAO.getOne("뼈해장국");
	}
	@Test
	public void getMenuWithCategoriTest() {
		menuListDAO.getMenuWithCategori("한식");
	}
	@Test
	public void getAllWithCategoriTest() {
		menuListDAO.getAllWithCategori("중식");
	}
	@Test
	public void insertTest() {
		MenuListVO vo = new MenuListVO();
		
		vo.setCategori_id(categoriDAO.getOne("일식").getCategori_id());
		vo.setMenu_cost(3000);
	//	vo.setMenu_id(4);
		vo.setMenu_name("알밥");
	//	vo.setMenu_image("알밥 이미지");
		vo.setMenu_price(9000);
		log.info("=======================>>="+vo);
		menuListDAO.insert(vo);
	}
	@Test
	public void modifyTest() {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("menu_name", "김치찌개");
	//	parameters.put("menu_price", 8500);
		parameters.put("menu_cost", 4500);
	//	parameters.put("menu_use", 8500);
		MenuListVO vo = new MenuListVO();
		vo.setMenu_name("김치찌개");
		vo.setMenu_price(10000);
		menuListDAO.modify(vo);
	}
	@Test
	public void delOneTest() {
		menuListDAO.delOne("초밥");
	}
	@Test
	public void getMenuWithCategoriAndImageTest() {
		menuListDAO.getMenuWithCategoriAndImage("한식");
	}
	@Test
	public void getMenuWithImageTest() {
		menuListDAO.getMenuWithImage();
	}
	@Test
	public void getCategoryRecommendedMenuTest() {
		menuListDAO.getCategoryRecommendedMenu("10", 2,null);
	}
}
