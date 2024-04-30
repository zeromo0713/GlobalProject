package kr.co.service;

import static org.junit.Assert.assertNotNull;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

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
public class MemberServiceTest {
	@Autowired MemberService service;
	
	@Test
	public void serviceTest() {
		assertNotNull(service);
	}
	@Test
	public void memberJoinTest() throws Exception {
		MemberVO vo = new MemberVO();
		vo.setMem_ph_num("01011111111");
		//vo.setMem_birth(new SimpleDateFormat("yyyy-MM-dd").parse("1998-07-13")); //==> mem_birth의 Date를 java.util에서 java.sql.Date 로 수정해서 나오는 에러..

		
		log.info(service.memberJoin(vo, null,null));
	}
/*	@Test
	public void getCountTest() {
		service.getCount();
		log.info(service.getCount());
	}
	@Test
	public void getListTest() {
		service.getList();
		log.info(service.getList());
	}
	@Test
	public void getOneTest() {
		MemberVO vo = new MemberVO();
		service.getOne(vo);
		log.info(service.getOne(vo));
	}
	@Test
	public void insertTest() {
		MemberVO vo = new MemberVO();
		vo.setName("빵빵모");
		vo.setPhNum("01012345678");
		log.info(service.insert(vo));
	}
	@Test
	public void modifyTest() {
		MemberVO vo = new MemberVO();
		vo.setName(service.getOne(vo).getName());
		vo.setPhNum("1234567891");
		service.modify(vo);
		log.info(service.modify(vo));
	}
	@Test
	public void deleteTest() {
		service.delete("양모");
		int result = service.delete("양모");
		log.info(result);
	}
*/	
}
