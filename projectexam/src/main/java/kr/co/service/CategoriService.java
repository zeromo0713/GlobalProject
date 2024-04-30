package kr.co.service;

import java.util.HashMap;
import java.util.List;

import kr.co.vo.CategoriVO;

public interface CategoriService {
	
	public List<CategoriVO> getList();

	public int addCategori(CategoriVO vo);

}
