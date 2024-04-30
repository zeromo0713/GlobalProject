package kr.co.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.dao.MenuListDAO;
import kr.co.service.CategoriService;
import kr.co.service.MenuListService;
import kr.co.service.OrderListService;
import kr.co.util.UploadFileUtils;
import kr.co.vo.CategoriVO;
import kr.co.vo.ExcelData;
import kr.co.vo.MenuListVO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MenuController {

	@Autowired CategoriService categoriService;
	@Autowired MenuListService menuListService;
	@Autowired OrderListService orderListService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
		
	@GetMapping(value = "/company/menulist")
//	@PostMapping(value = "/company/menulist")
	public String menulist(@RequestParam(name = "categoryName", required = false) String categori_name,  		
							HttpSession session ,
							Model model) {
		// categoryName이 null인 경우 기본적으로 설정할 값 (예: '한식')
	    String defaultCategory = "추천";
	 // 주문 내역이 없을 경우에는 default_category를 커피로 지정
	    System.out.println("---------------------------시작은 하나?? --------------------------");
	    if(menuListService.getRecommendedMenu(session) == null) {
	    	defaultCategory = "한식";
	    }
	    
	    // categoryName이 없을 때 기본 카테고리로 설정
	    if (categori_name == null) {
	    	categori_name = defaultCategory;
	    }
	    // DB에서 카테고리 데이터 가져오기   ==> 카테고리를 화면에 나타내기 위해
		List<CategoriVO> categoriList = categoriService.getList();
		// DB에서 카테고리와 관련된 메뉴 데이터 가져오기	==> 카테고리에 해당되는 메뉴를 나타내기 위해서
		List<HashMap<String, Object>> menuList;
		// 카테고리가 추천메뉴일 경우에는 menuList에 추천 메뉴를 가져온다.
		if (categori_name.equals("추천")) {
		    menuList = menuListService.getRecommendedMenu(session);
		}else { // 카테고리가 추천메뉴가 아닌 경우에는 선택한 카테고리에 해당하는 메뉴들을 나타낸다.
			menuList = menuListService.getMenuPriceWithCategoriName(categori_name);
		}	    
	    
	    // DB에서 모든 메뉴 데이터 가져오기	==> 총 결제금액은 카테고리 상관없이 메뉴가 다 들어있기에 가격을 알기 위해 가져옴
	    List<HashMap<String, Object>> allMenuList = menuListService.getMenuPrice();
	    // Jackson ObjectMapper를 사용하여 List<Map>을 JSON 문자열로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonMenuList = "";
	    String jsonAllMenuList = "";
	    try {
	        jsonMenuList = objectMapper.writeValueAsString(menuList);
	        jsonAllMenuList = objectMapper.writeValueAsString(allMenuList);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	    }
	    // 모델에 JSON 형태의 메뉴 데이터 추가
	    model.addAttribute("jsonMenuList", jsonMenuList);	//카테고리에 해당되는 메뉴와 가격을 jsonMenuList에 추가
        model.addAttribute("categoriList", categoriList);	//카테고리 목록을 categoriList에 추가
        model.addAttribute("jsonAllMenuList", jsonAllMenuList);	// 모든 메뉴의 이름가 가격을 jsonAllMenuList에 추가
		return "/company/menulist";
	}
	
	@GetMapping(value = "/company/payment")
	public String showPaymentConfirmation(@RequestParam Map<String, Object> params, 
											HttpSession session, Model model) {
	    // 받아온 주문 정보를 모델에 추가
	    model.addAttribute("selectedItems", params.get("selectedItems"));
	    model.addAttribute("totalPrice", params.get("totalPrice"));
		orderListService.saveOrderHistory(params,session); // 주문 내역 저장을 위해 일단 params와 session을 서비스로 넘겨주고 서비스에서 처리한다.
	    // 주문이 완료되었습니다 메시지 추가
	    model.addAttribute("message", "주문이 완료되었습니다");
	    
	    return "/company/payment";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping(value = "/company/test")
	public String test(Model model,MultipartFile file, MenuListVO vo) throws  Exception {
		List<HashMap<String, Object>> exMenuList = menuListService.getWithImage();
		System.out.println(exMenuList);
		model.addAttribute("exMenuList", exMenuList);
		return "/company/test"; 
	}
	@PostMapping(value = "/company/test")
	public String testPost(Model model,MultipartFile file, MenuListVO vo,String categori_name) throws  Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload 
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름
		System.out.println(categori_name);
		System.out.println("=======컨트롤러1111========="+vo);
		if(file != null) {
			System.out.println("=======여기인가요...1111========="+vo);
			System.out.println("=======imgUploadPath...1111========="+imgUploadPath);
			System.out.println("=======file.getOriginalFilename()...1111========="+file.getOriginalFilename());
			System.out.println("======= file.getBytes()...1111========="+ file.getBytes());
			System.out.println("======= ymdPath..1111========="+ ymdPath);
			// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
		   fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
		   System.out.println("======= fileName..1111========="+ fileName);
		} else {
			System.out.println("=======여기인가요...2222========="+vo);
		   fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		   System.out.println("======= fileName..2222========="+ fileName);
		}
		System.out.println("=======컨트롤러2222========="+vo);
		vo.setMenu_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setThunb_menu_image_path(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		menuListService.menuAdd(categori_name, vo);
		System.out.println("=======컨트롤러3333========="+vo);
		return ":redirect/company/test"; 
	}
	
	@GetMapping("/company/test2")
	public String showExcelData(Model model) {
	    try {
	        String filePath = "C:\\Users\\임영모\\OneDrive\\바탕 화면\\report.xlsx";
	        FileInputStream fis = new FileInputStream(new File(filePath));
	        Workbook workbook = WorkbookFactory.create(fis);
	        List<String> header = new ArrayList<>();
	        List<List<String>> rows = new ArrayList<>();
	        for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
	            Sheet sheet = workbook.getSheetAt(i);
	            for (Row row : sheet) {
	                List<String> rowData = new ArrayList<>();
	                for (Cell cell : row) {
	                    rowData.add(cell.toString());
	                }
	                rows.add(rowData);
	            }
	        }
	        // 첫 번째 시트의 첫 번째 행을 헤더로 설정
	        if (!rows.isEmpty()) {
	            header = rows.get(0);
	            rows.remove(0); // 첫 번째 행 제거
	        }
	        fis.close();
	        ExcelData excelData = new ExcelData(header, rows);
	        model.addAttribute("excelData", excelData);
	    } catch (IOException e) {
	        e.printStackTrace();
	        model.addAttribute("error", "Error occurred while reading Excel file.");
	    }
	    return "/company/test2"; 
	}

	
}
