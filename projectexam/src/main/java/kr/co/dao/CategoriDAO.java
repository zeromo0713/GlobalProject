package kr.co.dao;

import java.util.List;

import kr.co.vo.CategoriVO;

public interface CategoriDAO {
	
	public int insert(CategoriVO vo);
	public int modify(CategoriVO vo);
	public int delOne(String categori_id);
	public void delAll();
	
	public CategoriVO getOne(String categori_name);
	public List<CategoriVO> getList();
	public int getCount();
}
