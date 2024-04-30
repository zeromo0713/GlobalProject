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
public class IngredientsDAOTest {
	
	@Autowired IngredientsDAO ingredientsDAO;
	
	@Test
	public void beanTest() {
		assertNotNull(ingredientsDAO);
	}
	
	@Test
	public void getAllTest() {
		ingredientsDAO.getAll();
	}
	@Test
	public void getOneTest() {
		ingredientsDAO.getOne("김치");
	}
	@Test
	public void getCountTest() {
		ingredientsDAO.getCount();
	}
	@Test
	public void insertTest() {
		log.info(ingredientsDAO.insert("우거지"));
	}
	@Test
	public void delOne() {
		log.info("=============>"+ingredientsDAO.delOne("짜장"));
	}
}
