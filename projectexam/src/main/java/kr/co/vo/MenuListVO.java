package kr.co.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuListVO {

	private String categori_id;
	private Integer menu_id;
	private String menu_name;
    private String menu_image; // 파일 경로를 저장하는 부분   실제 DB에는 이 부분이 저장

    private String thunb_menu_image_path; //일단 썸네일용 이미지인데 불필요시 삭제할 필드
    
    private Integer menu_price;
	private Integer menu_cost;
	private Integer menu_use;
	

}
