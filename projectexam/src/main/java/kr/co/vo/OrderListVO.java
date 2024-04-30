package kr.co.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderListVO {
	
	private Integer order_id;
	private String categori_id;
	private Integer menu_id;
	private String mem_ph_num;
	private Integer sale_price;
	private Integer sale_rate;
	private Date sale_date;

}
