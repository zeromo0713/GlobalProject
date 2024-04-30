package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.CategoriDAO;
import kr.co.vo.CategoriVO;
@Service
public class CategoriServiceImpl implements CategoriService {
	
	@Autowired CategoriDAO categoriDAO;
	
	@Override
	public List<CategoriVO> getList() {
		return categoriDAO.getList();
	}

	@Override
	public int addCategori(CategoriVO vo) {
		return categoriDAO.insert(vo);
	}

}
