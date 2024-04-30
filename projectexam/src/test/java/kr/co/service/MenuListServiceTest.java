package kr.co.service;

import static org.junit.Assert.assertNotNull;

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
public class MenuListServiceTest {
	
	@Autowired MenuListService menuListService;
	
	@Test
	public void beanTest() {
		assertNotNull(menuListService);
	}
	@Test
	public void menuAddTest() {
		MenuListVO vo = new MenuListVO();
		vo.setMenu_name("소갈비찜");
		//vo.setMenu_image("소갈비찜 이미지");
		vo.setMenu_price(15000);
		vo.setMenu_cost(7000);
		menuListService.menuAdd("한식", vo);
	}
	@Test
	public void getWithImageTest() {
		menuListService.getWithImage();
	}
	@Test
	public void getRecommendedMenuTest() {
//		menuListService.getRecommendedMenu();
	}
}
