package kr.co.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface OrderListService {

	void saveOrderHistory(Map<String, Object> params, HttpSession session);

	
	
}
