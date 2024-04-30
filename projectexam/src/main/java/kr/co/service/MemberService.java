package kr.co.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.vo.Criteria;
import kr.co.vo.MemberVO;


public interface MemberService {
	
	MemberVO getMember(MemberVO vo);
	
	int memberJoin(MemberVO vo, HttpSession session, Model model);

	int login(MemberVO vo, HttpSession session, Model model, HttpServletRequest request);

	List<MemberVO> getMemberWithAgeGroup(String age_group,Criteria criteria);

	int modifyGrade(MemberVO vo);

	int getCount(String age_group, Criteria criteria);

	List<MemberVO> getAllMemberWithAgeGroup();
	

	
	
}
