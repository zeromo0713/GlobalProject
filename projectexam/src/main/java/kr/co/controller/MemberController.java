package kr.co.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.service.MemberService;
import kr.co.vo.MemberVO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {
	
	@Autowired MemberService service;
	//회원가입 과정
	@GetMapping(value = "/company/join")
	public void join() {	
	}//그냥 회원가입을 눌렀을 때는 회원가입 창으로 가진다.
	@PostMapping(value = "/company/join")
	public String memJoin(@RequestParam("mem_birth_year") String year,
						  @RequestParam("mem_birth_month") String month,
						  @RequestParam("mem_birth_day") String day,
						  MemberVO vo,HttpSession session,  Model model) throws ParseException {
		String birthResult = year+"-"+month+"-"+day; //페이지에서 연, 월, 일을 다로 받아서 하나의 문자열로 생성
		// java.sql.Date를 사용하여 날짜를 저장
        vo.setMem_birth(new Date(new SimpleDateFormat("yyyy-MM-dd").parse(birthResult).getTime())); //문자열 형식의 날짜를 날짜 형식으로 변환
        int result = service.memberJoin(vo, session ,model);
        if(result == 0) {
        	return "/company/join";
        }
		return "redirect:/company/menulist";
	}
   
	
	//로그인 창으로 가는 것 또는 회원가입 후 로그인 창으로 오는 과정
	@GetMapping(value = "/company/login")
	public void login() {
	}
	@PostMapping(value = "/company/login")
	public String login(MemberVO vo, HttpSession session, Model model, HttpServletRequest request) {
	    int result = service.login(vo, session, model, request);
	    String gradeName = (String) session.getAttribute("gradeName");
	    //로그인이  실패했을 경우
	    if (result == 0) {
	        return "/company/login";
	    }
	    //로그인 했을 때 등급이 "관리자" 인경우
	    if ("관리자".equals(gradeName)) {
	        return "redirect:/company/manager";
	    }

	    return "redirect:/company/menulist";
	}
	
	
	//로그인을 하면 회원세션을 가지고 메뉴리스트로 가는 것 || 비회원의 경우 그냥 바로 가는것
	
	@GetMapping(value = "/company/logout")
	public String logout(/*HttpServletRequest request*/ HttpSession session  ) {
		//request.getSession().invalidate();
		session.invalidate();
		//session을 사용하던 request를 사용하던 알아서 잘^^
		return "redirect:/";
	}
	
	
	
	@GetMapping(value = "/company/manager")
	@PostMapping(value = "/company/manager")
	public String manager(HttpSession session, Model model) {
		String gradeName = (String) session.getAttribute("gradeName");
/*		if(!"관리자".equals(gradeName)) {
			System.out.println("========여기는 뭐여======>>"+gradeName);
			session.invalidate(); //로그아웃은 시키던지 안시키던지 자유
			return "redirect:/company/login";
		}*/
		return "/company/manager";
	}
	

	
}
