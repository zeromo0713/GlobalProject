package kr.co.dao;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.vo.CategoriVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class OrderListDAOTest {
	
	@Autowired
	OrderListDAO orderListDAO;
	
	@Test
	public void categoriDAOTest() {
		assertNotNull(orderListDAO);
	}
	
	@Test
	public void getListTest() {
		log.info(orderListDAO.getAll());
	}
	
	@Test
	public void getCountTest() {
		orderListDAO.getCount();
	}
	@Test
	public void insertTest() {
	//	orderListDAO.insert( "123412341234","짜장면", 8);
	//	orderListDAO.insert( "123412341234","돈까스", 4);
		String mem_ph_num = "123412341234";
		String menu_name = "돈까스";
		int sale_rate = 2;
		orderListDAO.insert(mem_ph_num, menu_name, sale_rate);
	}
	@Test
	public void getCategoriTest() {
		orderListDAO.getCategori("한식");
	}
	@Test
	public void getMenuTest() {
		orderListDAO.getMenu("비빔밥");
	}
	@Test
	public void getCategorySalesRatioTest() {
		orderListDAO.getCategorySalesRatio("01031223910");
	}
	@Test
	public void getCountSaleRateTest() {
		orderListDAO.getCountSaleRate("01031223910");
	}
}
