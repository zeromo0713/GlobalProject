package kr.co.dao;

import static org.junit.Assert.assertNotNull;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.vo.MemberVO;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberDAOTest {
	@Autowired MemberDAO dao;
	
	@Test
	public void daoTest() {
		assertNotNull(dao);
	}
	@Test
	public void getListTest() {
		dao.getList();
	}
	@Test
	public void getCountTest() {
		dao.getCount();
		log.info(dao.getCount());
	}
	@Test
	public void insertTest() throws Exception {
		MemberVO vo = new MemberVO();
		vo.setMem_ph_num("01012345678");
		//vo.setMem_birth(new SimpleDateFormat("yyyy-MM-dd").parse("1998-07-13"));   //==> mem_birth의 Date를 java.util에서 java.sql.Date 로 수정해서 나오는 에러..
		vo.setMem_gender(1);
		vo.setMem_grade(1);
		vo.setMem_unique_num("5678");
		log.info(dao.insert(vo));	
	}
	@Test
	public void getOneTest() {
		dao.getOne("01012345678");
		log.info(dao.getOne("01012345678"));
	}
	@Test
	public void modifyTest() {
		MemberVO vo = new MemberVO();
		vo.setMem_ph_num("0112345678");
		vo.setMem_unique_num("5678");
		log.info("=========="+dao.modify(vo));
	}
	@Test
	public void modify_gradeTest() {
		MemberVO vo = new MemberVO();
		vo.setMem_grade(0);
		vo.setMem_ph_num("0112345678");
		log.info(dao.modify_grade(vo));
	}
	
	@Test
	public void deleteTest() {
		dao.delete("영모");
		
	}
	@Test
	public void getListWithAgeGroupTest() {
		log.info(dao.getAllListWithAgeGroup());
		
	}
	@Test
	public void getCountWithAgeGroupTest() {
		dao.getCountWithAgeGroup("", null);
	}
}
