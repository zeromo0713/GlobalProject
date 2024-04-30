package kr.co.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.vo.Criteria;
import kr.co.vo.MemberVO;

public interface MemberDAO {

	public int insert(MemberVO vo);
	public int modify(MemberVO vo);
	public int modify_grade(MemberVO vo);
	public int delete(String mem_ph_num);
	public void deleteAll();
	 
	public List<MemberVO> getListWithAgeGroupPaging(@Param(value = "age_group") String age_group, @Param("criteria") Criteria criteria);
	public int getCountWithAgeGroup(@Param(value = "age_group") String age_group, @Param("criteria")Criteria criteria);
	public List<MemberVO> getAllListWithAgeGroup();
	public List<MemberVO> getList();
	public MemberVO getOne(String mem_ph_num);
	public int getCount();	
	public int updatePoint(@Param(value = "mem_ph_num") String mem_ph_num, @Param(value = "savingPoints") double savingPoints);
}
