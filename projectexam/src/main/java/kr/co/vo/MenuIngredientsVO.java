package kr.co.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuIngredientsVO {
	
	private Integer menu_ingri_num;
	private Integer menu_id;
	private String categori_id;
	private String ingredient_id;
	private Integer use_ingredient;
	

}
