package kr.co.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.dao.MemberDAO;
import kr.co.vo.Criteria;
import kr.co.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired MemberDAO dao;
	
	String[] gradeName = "관리자/ 일반회원/ 우수회원/ VIP".split("/ ");
	
	
	
	@Override
	public int memberJoin(MemberVO vo,HttpSession session, Model model) {
		String num = vo.getMem_ph_num();		//입력된 핸드폰 번호를 가져와서 num이라는 변수에 담고
		String subStr = num.substring(num.length() - 4);	//마지막 자리 4자리만 추출하여 sunStr이라는 변수에 담는다
		vo.setMem_unique_num(subStr);// 핸드폰번호를 통해 마지막 4자리만 부여함으로써 자동으로 고유번호를 부여함 --->> QR코드 대체		
		// 중복된 전화번호인지 확인
	    if ( dao.getOne(vo.getMem_ph_num()) != null ) {
	        // 이미 해당 전화번호의 회원이 존재할 경우
	        model.addAttribute("message", vo.getMem_ph_num() + "번호는 이미 등록된 전화번호입니다.");
	        return 0;
	    }
	    // 회원가입 처리
	    int result = dao.insert(vo);
	    if (result != 1) {
	        model.addAttribute("message", vo.getMem_ph_num() + " 입력 실패입니다.<br />");
	        return 0;
	    }
	    // 회원가입 성공 시 세션 설정
	    MemberVO getVO = dao.getOne(vo.getMem_ph_num());
	    session.setAttribute("loginObj", getVO);
	    session.setAttribute("gradeName", gradeName[getVO.getMem_grade()]);
	    // model.addAttribute("message", result+"개의 자료가 입력"+ vo.getName()+ "님 환영합니다");
	    return result;
	}



	@Override
	public MemberVO getMember(MemberVO vo) {	
		return dao.getOne(vo.getMem_ph_num());
	}


	@Override
	public int login(MemberVO vo, HttpSession session, Model model, HttpServletRequest request) {
		MemberVO getMemberVO = this.getMember(vo);
		if(getMemberVO == null || ! vo.getMem_unique_num().equals(getMemberVO.getMem_unique_num())) {
			// 로그인 실패 시 loginError 속성을 request에 추가
	        request.setAttribute("loginError", "핸드폰 번호 또는 고유번호가 일치하지 않습니다.");
	        return 0;
		}
		session.setAttribute("loginObj", dao.getOne(vo.getMem_ph_num()));
		session.setAttribute("gradeName", gradeName[getMemberVO.getMem_grade()]);
		return 1;
	}



	@Override
	public List<MemberVO> getMemberWithAgeGroup(String age_group,Criteria criteria) {
		System.out.println("========서비스111====>>"+age_group);
		if(age_group==null) {
			age_group ="";
		}
		Criteria criteria2 = new Criteria();
		return  dao.getListWithAgeGroupPaging(age_group,criteria);
	}



	@Override
	public int modifyGrade(MemberVO vo) {
		return dao.modify_grade(vo);
	}



	@Override
	public int getCount(String age_group, Criteria criteria) {
		if(age_group==null) {
			age_group ="";
		}
		return dao.getCountWithAgeGroup(age_group,criteria);
	}



	@Override
	public List<MemberVO> getAllMemberWithAgeGroup() {
		return dao.getAllListWithAgeGroup();
	}

	
}
