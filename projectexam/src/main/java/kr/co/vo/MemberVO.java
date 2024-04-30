package kr.co.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	
	//DB에 저장된 컬럼(필드)
	private String mem_ph_num;
	private java.sql.Date mem_birth;
	private Integer mem_gender;
	private Date mem_regidate;
	private Integer mem_grade;
	private String mem_unique_num;
	private String mem_point;
	
	
	//서브 쿼리 또는 조인으로 인해 생성되는 필드(컬럼)
	private Integer total_sale_price;
	private Integer age;
	private String age_group;
	

	
}
