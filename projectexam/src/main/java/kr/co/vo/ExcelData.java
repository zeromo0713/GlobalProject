package kr.co.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExcelData {
	
	private List<String> header;
    private List<List<String>> rows;
}
