package kr.co.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.dao.MemberDAO;
import kr.co.dao.OrderListDAO;
import kr.co.vo.MemberVO;
@Service
public class OrderListServiceImpl implements OrderListService {
	
	@Autowired OrderListDAO orderListDAO;
	@Autowired OrderListServiceImpl orderListServiceImpl;
	@Autowired MemberDAO memberDAO;

	@Override
	public void saveOrderHistory(Map<String, Object> params, HttpSession session) {
	    // 만들어둔 processSelectedItems메소드를 이용하여 selectedItems 키의 값 추출(주문한 메뉴와, 주문한 수량만 추출하는 작업)
	    Object selectedItemsObj = params.get("selectedItems");
	    Object totalPrice = params.get("totalPrice");
	    // 로그인한 회원이 있다면 적립금 계산 및 업데이트 실행
	    if (session.getAttribute("loginObj") != null) {
	    	MemberVO vo = (MemberVO) session.getAttribute("loginObj");
	    	//포인트 차감을 위한 if문
	    	if(params.get("pointsToUse") != null) {
	    		double pointsToUse = Double.parseDouble(String.valueOf(params.get("pointsToUse")));
	    		memberDAO.updatePoint(vo.getMem_ph_num(), -((double) pointsToUse));
	    	}
	        // totalPrice를 적절한 형식으로 형변환하여 전달
	        double totalPriceValue = Double.parseDouble(String.valueOf(totalPrice));
	        calculateAndUpdatePoint(session, totalPriceValue);
	    }
	    
	    // 주문 처리 및 세션 초기화
	    orderListServiceImpl.processSelectedItemsGetSessionInsertOrder(selectedItemsObj, session); 
	    session.invalidate();
	}
	public void processSelectedItemsGetSessionInsertOrder(Object selectedItemsObj, HttpSession session) {
		System.out.println("==========processSelectedItemsGetSessionInsertOrder부분=========");
		//타입 변환: params.get("selectedItems")에서 반환되는 값이 Map<String, Integer>가 아닌 다른 형태일 경우에 대한 처리를 고려합니다. 데이터가 JSON 문자열로 넘어오고 있다면 해당 문자열을 다시 매핑할 수 있습니다.
		//이렇게 하면 예외 발생 시에도 타입이 무엇인지 확인할 수 있습니다. 위의 코드에서 instanceof 연산자를 사용하여 객체의 타입을 체크하고, 이에 따라 적절한 처리를 수행합니다.
        if (selectedItemsObj instanceof String) {
        	// JSON 문자열을 Map으로 변환
            try {
                Map<String, Integer> selectedItems = new ObjectMapper().readValue((String) selectedItemsObj, new TypeReference<Map<String, Integer>>() {});
                // 추출한 값 출력 또는 다른 작업 수행, selectedItems의 타입이 LinkedHashMap,
                // LinkedHashMap의 키와 값을 각각 추출
                for (String menu_name : selectedItems.keySet()) {
                	int sale_rate = selectedItems.get(menu_name);
                    //세션아이디에서 폰 번호를 구해오기
            	    MemberVO vo = (MemberVO) session.getAttribute("loginObj");
            	    String mem_ph_num;
            	    if (vo != null) { //세션이 있는 경우(회원으로 로그인을 한 경우)
            	        mem_ph_num = vo.getMem_ph_num();
            	    } else {
            	        // 세션이 없는 경우 처리(회원이 아닌 비회원인 경우)
            	        mem_ph_num = "01000000000";
            	    }           	   
            	    //세션아이디, 메뉴이름, 주문수량 모두 입력하도록 DAO로 보내기 반복
                    orderListDAO.insert(mem_ph_num, menu_name, sale_rate);
                }
            } catch (JsonProcessingException e) {
                e.printStackTrace();
                // JSON 파싱 예외 처리
            }
        } else {
        }
    }
	// 회원 등급에 따른 적립금 계산 및 업데이트
	private void calculateAndUpdatePoint( HttpSession session, double totalPriceValue) {
	    // 회원 등급에 따른 적립율 정의
	    double[] savingsRates = {0.01, 0.03, 0.05}; // 등급별 적립율 (1%, 3%, 5%)

	    // 회원 정보 가져오기
	    MemberVO vo = (MemberVO) session.getAttribute("loginObj");
	    int grade = vo.getMem_grade();
	    System.out.println(session.getAttribute("loginObj"));

	    // 해당 회원 등급에 따른 적립율 적용
	    double savingsRate = savingsRates[grade - 1]; // 회원 등급에 맞는 적립율 가져오기
	    double savingPoints = totalPriceValue * savingsRate; // 적립할 포인트 계산
	    
	    
	    // 적립된 포인트를 회원 정보에 추가 또는 업데이트
	    String mem_ph_num = vo.getMem_ph_num();
	    memberDAO.updatePoint(mem_ph_num ,savingPoints);
	}

}
