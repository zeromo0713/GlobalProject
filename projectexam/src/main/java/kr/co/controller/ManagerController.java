package kr.co.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.CategoriService;
import kr.co.service.MemberService;
import kr.co.service.MenuListService;
import kr.co.util.UploadFileUtils;
import kr.co.vo.CategoriVO;
import kr.co.vo.Criteria;
import kr.co.vo.MemberVO;
import kr.co.vo.MenuListVO;
import kr.co.vo.PageDTO;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/company/manager/**")
@Log4j
public class ManagerController {
	
	@Autowired MenuListService menuListService;
	@Autowired CategoriService categoriService;
	@Autowired MemberService memberService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@GetMapping(value = "/menumanage")
	public String menu(@RequestParam(name = "categoryName", required = false) String categori_name,  		
						HttpSession session ,
						Model model) {
		// categoryName이 null인 경우 기본적으로 설정할 값 (예: '한식')
	    String defaultCategory = "한식";
	    // categoryName이 없을 때 기본 카테고리로 설정
	    if (categori_name == null) {
	    	categori_name = defaultCategory;
	    }
	    // DB에서 카테고리 데이터 가져오기   ==> 카테고리를 화면에 나타내기 위해
 		List<CategoriVO> categoriList = categoriService.getList();
 		// 선택된 카테고리별 메뉴를 가져오기 위해, 카테고리별 모두를 가져오는 역할
		List<MenuListVO> menuList = menuListService.getMenuForModify(categori_name);
		model.addAttribute("menuList", menuList);
		model.addAttribute("categoriList", categoriList);	//카테고리 목록을 categoriList에 추가
		return "/company/manager/menumanage";
	}
	
	@PostMapping(value = "/menumanage/menuadd")
	public String menuAdd(@RequestParam("file") MultipartFile file ,
								String categori_name,  MenuListVO vo, Model model,
								RedirectAttributes redirectAttributes) throws  Exception{
		String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload 
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름
		if(file != null) {
			// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
		   fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
		} else {
		   fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		vo.setMenu_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setThunb_menu_image_path(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		menuListService.menuAdd(categori_name, vo);
		return "redirect:/company/manager/menumanage";
	}
	
	
	
	
	@PostMapping(value = "/menumanage/menumodify")
	public String menuModify(MenuListVO vo) {
		menuListService.menuModify(vo);
		return "redirect:/company/manager/menumanage";
	}
	@PostMapping(value = "/menumanage/menudelete")
	public String menuDelete(String menu_name) {
		menuListService.deleteMenu(menu_name);
		return "redirect:/company/manager/menumanage";
	}
	@PostMapping(value = "/menumanage/categoriadd")
	public String categoriAdd(CategoriVO vo) {
		categoriService.addCategori(vo);
		return "redirect:/company/manager/menumanage";
	}

	
	
	@GetMapping(value = "/member")
	public String member(Criteria criteria,Model model, String age_group) {
		//나이대별로, 페이징을 하기 위해 구한 memberList
		List<MemberVO> memberList = memberService.getMemberWithAgeGroup(age_group,criteria);
		//나이대를 구하고, 페이징 관계없이 전체 데이터 가져오기  --> 그래프를 만들기 위해
		List<MemberVO> memberListAll = memberService.getAllMemberWithAgeGroup();
		model.addAttribute("memberList", memberList); //페이징을 위한 memeberList
		model.addAttribute("memberListAll", memberListAll); //그래프를 위한 memberListAll
		model.addAttribute("pageMaker", new PageDTO(criteria, memberService.getCount(age_group,criteria)));

		return "/company/manager/member";
	}
	@PostMapping(value = "/member")
	public String memberModify(Model model, MemberVO vo) {
		memberService.modifyGrade(vo);
		return "redirect:/company/manager/member";
	}
	
	@GetMapping(value = "/salesanalysis")
	public String salesanalysis(Model model) {
        // JSP 페이지로 이동
        return "/company/manager/salesanalysis";
    }
	
	//파이썬 결과인 그래프 및 엑셀 바탕화면에 저장
	@PostMapping(value = "/salesanalysis") 
    public String selectSalesAnalysis(@RequestParam String start_day, 
                                      @RequestParam String end_day, 
                                      @RequestParam String analy_check, 
                                      Model model) {
        System.out.println(analy_check);
        //현재 실행 중인 자바 코드의 작업 디렉토리를 확인합니다.
        Path currentRelativePath = Paths.get("");
        String currentPath = currentRelativePath.toAbsolutePath().toString();
        System.out.println("Current absolute path is: " + currentPath);
        try {
            // 파이썬 스크립트 실행
            String pythonScript = "E:/zeromo/workspace/pythonws/projectMain/main.py";
            
            // 바탕화면 경로 가져오기
            String desktopPath = System.getProperty("user.home") + "/OneDrive/바탕 화면/";
            
            // 그래프 및 엑셀 파일을 저장할 위치 지정
            String savePath = desktopPath; // 바탕화면 경로로 저장
            
            // 파이썬 스크립트 실행 및 저장 경로 설정
            ProcessBuilder processBuilder = new ProcessBuilder("python", pythonScript, start_day, end_day, analy_check);
            processBuilder.directory(new File(savePath)); // 그래프 및 엑셀 파일을 저장할 위치 설정
            Process process = processBuilder.start();
            
            // 파이썬 스크립트의 실행 결과 읽기
            InputStream inputStream = process.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "euc-kr"));
            StringBuilder resultBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                resultBuilder.append(line).append("<br>");
            }
        
            // 프로세스 종료 및 자원 해제
            process.waitFor();
            reader.close();
            
            // 파이썬 스크립트의 결과를 JSON 형식으로 변환
            StringBuilder jsonData = resultBuilder;

            // 결과를 Model에 추가
            model.addAttribute("pythonScriptResult", jsonData);
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리
            model.addAttribute("pythonScriptResult", "Error occurred: " + e.getMessage());
        }

        return "/company/manager/salesanalysis";
    }
	
/*	
	//파이썬 결과인 그래프 및 엑셀 현재 실행 중인 자바 코드의 작업 디렉토리에 저장
	@PostMapping(value = "/salesanalysis")
	public String selectsalesanalysis(@RequestParam String start_day, 
									  @RequestParam String end_day, 
									  @RequestParam String analy_check, 
									  Model model) {
		try {
            // 파이썬 스크립트 실행
			String pythonScript = "D:/zeromo/workspace/pythonws/projectMain/main.py";
			ProcessBuilder processBuilder = new ProcessBuilder("python", pythonScript, start_day, end_day, analy_check);
            Process process = processBuilder.start();       
            
            // 파이썬 스크립트의 실행 결과 읽기
            InputStream inputStream = process.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "euc-kr"));
            StringBuilder resultBuilder = new StringBuilder();
            String line;        
            while ((line = reader.readLine()) != null) {
                resultBuilder.append(line).append("<br>");
            }      
            
            //현재 실행 중인 자바 코드의 작업 디렉토리를 확인합니다.
            Path currentRelativePath = Paths.get("");
            String currentPath = currentRelativePath.toAbsolutePath().toString();
           System.out.println("Current absolute path is: " + currentPath);
            
            // 프로세스 종료 및 자원 해제
            process.waitFor();
            reader.close();
            
            // 파이썬 스크립트의 결과를 JSON 형식으로 변환
            StringBuilder jsonData = resultBuilder;
            
            // 결과를 Model에 추가
            model.addAttribute("pythonScriptResult", jsonData);
        } catch (Exception e) {        	
            e.printStackTrace();
            // 예외 처리
            model.addAttribute("pythonScriptResult", "Error occurred: " + e.getMessage());
        }

        // JSP 페이지로 이동
        return "/company/manager/salesanalysis";
    }
*/	
	
	@GetMapping(value = "/discount")
	public String member() {
		return "/company/manager/discount";
	}
}
