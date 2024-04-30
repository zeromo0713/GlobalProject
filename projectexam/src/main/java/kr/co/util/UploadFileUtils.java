package kr.co.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import net.coobird.thumbnailator.Thumbnails;

public class UploadFileUtils {
	/* 파일을 저장하고, 파일이 저장될 폴더를 생성할 새로운 패키지를 생성
	 * 이렇게 패키지를 따로 만드는 이유는, 컨트롤러에서 처리하기에 기능적인 성격이 다르기 때문.
	 */
	
	
	
   // 썸네일의 크기
   static final int THUMB_WIDTH = 300;
   static final int THUMB_HEIGHT = 300;
   
   // 파일 업로드 메서드
   public static String fileUpload(String uploadPath,
						           String fileName,
						           byte[] fileData, String ymdPath) throws Exception {

		// UUID를 사용하여 파일명 중복 방지
		UUID uid = UUID.randomUUID();		
		// 새로운 파일명 생성
		String newFileName = uid + "_" + fileName;		
		// 이미지 저장 경로 설정
		String imgPath = uploadPath + ymdPath;		
		// 실제 이미지 파일 생성
		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);		
		// 썸네일 파일명 생성
		String thumbFileName = "s_" + newFileName;		
		// 이미지 파일과 썸네일 파일 생성
		File image = new File(imgPath + File.separator + newFileName);
		File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);
		
		// 원본 이미지가 존재하면 썸네일 생성
		if (image.exists()) {
		 // 썸네일 저장 경로 생성
		 thumbnail.getParentFile().mkdirs();		 
		 // 썸네일 생성 및 저장
		 Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
		}
		// 새로 생성된 파일명 반환
		return newFileName;
   }
		
   // 날짜별 저장 경로 계산 메서드
   public static String calcPath(String uploadPath) {
	    Calendar cal = Calendar.getInstance();
	    // 년도, 월, 일에 해당하는 경로 생성
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		// 해당 경로들을 생성하고 반환
		makeDir(uploadPath, yearPath, monthPath, datePath);
		makeDir(uploadPath, yearPath, monthPath, datePath + "\\s");
		
	    return datePath;
   }
		
   // 디렉토리 생성 메서드
   private static void makeDir(String uploadPath, String... paths) {	
		// 이미 디렉토리가 존재하면 종료
		if (new File(paths[paths.length - 1]).exists()) { return; }	
		// 디렉토리 생성
		for (String path : paths) {
		File dirPath = new File(uploadPath + path);	
			// 디렉토리가 존재하지 않으면 생성
			if (!dirPath.exists()) {
			dirPath.mkdir();
			}
		}		
	}
   
   
}
