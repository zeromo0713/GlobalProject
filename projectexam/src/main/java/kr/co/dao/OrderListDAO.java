package kr.co.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.vo.OrderListVO;

public interface OrderListDAO {
	
	public int insert( @Param("mem_ph_num") String mem_ph_num,@Param("menu_name") String menu_name, @Param("sale_rate") int sale_rate);

	
	public List<OrderListVO> getAll();
	public OrderListVO getCategori(String categori_name);
	public OrderListVO getMenu(String menu_name);
	public int getCount();
	public List<HashMap<String, Object>> getCategorySalesRatio(String mem_ph_num); //카테고리별 판매량 구하기
	public int getCountSaleRate(String mem_ph_num);  //총 판매량 구하기
}
