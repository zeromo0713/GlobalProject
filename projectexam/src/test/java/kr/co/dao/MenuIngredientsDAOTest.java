package kr.co.dao;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MenuIngredientsDAOTest {
	
	@Autowired MenuIngredientsDAO menuIngredientsDAO;
	
	@Test
	public void beanTest() {
		assertNotNull(menuIngredientsDAO);
	}
	
	@Test
	public void getAllTest() {
		menuIngredientsDAO.getAll();
	}
	@Test
	public void getUseMenuTest() {
		menuIngredientsDAO.getUseMenu("김치찌개");
	}
	@Test
	public void getUseCategoriTest() {
		menuIngredientsDAO.getUseCategori("한식");
	}
	
	@Test
	public void insertTest() {
		menuIngredientsDAO.insert("된장찌개","두부" ,100 );
	}
	@Test
	public void delMenuTest() {
		menuIngredientsDAO.delMenu("된장찌개");
	}

}
