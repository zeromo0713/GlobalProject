package kr.co.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.vo.IngredientsVO;

public interface IngredientsDAO {
	
	public int insert(String ingredient_name);
	public int delOne(String ingredient_name);
	public void delAll();
	
	public List<IngredientsVO> getAll();
	public IngredientsVO getOne(String ingredient_name);
	public int getCount();
}
