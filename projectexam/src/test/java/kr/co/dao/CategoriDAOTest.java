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
public class CategoriDAOTest {
	
	@Autowired
	CategoriDAO categoriDAO;
	
	@Test
	public void categoriDAOTest() {
		assertNotNull(categoriDAO);
	}
	@Test
	public void insertTest() {
		CategoriVO vo = new CategoriVO();
		vo.setCategori_id("40");
		vo.setCategori_name("일식");
		categoriDAO.insert(vo);
	}
	@Test
	public void modifyTest() {
		CategoriVO vo = new CategoriVO();
		vo.setCategori_id("50");
		vo.setCategori_name("일식");
		categoriDAO.modify(vo);
	}
	@Test
	public void delOneTest() {
		categoriDAO.delOne("50");
	}
	
	@Test
	public void getListTest() {
		log.info(categoriDAO.getList());
	}
	
	@Test
	public void delAllTest() {
		categoriDAO.delAll();
	}
	@Test
	public void getOneTest() {
		categoriDAO.getOne("한식");
	}
	@Test
	public void getCountTest() {
		categoriDAO.getCount();
	}
}
