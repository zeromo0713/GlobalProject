package kr.co.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PointUsageVO {
	
	private Integer usage_id;
	private String mem_ph_num;
	private Date usage_date;
	private Integer total_price;
	private Integer points_used;
}
