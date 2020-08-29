package com.nbp.temp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("TempService")
public class TempServiceImpl implements TempService{
	@Autowired
	TempDAO dao;
	
	@Override
	public List<TempDTO> findAll(int pageNo) {
		return dao.findAll(pageNo);
	}

	@Override
	public List<TempDTO> findlastTemp() {
		return dao.findlastTemp();
	}

	@Override
	public List<TempDTO> findAll() {
		return dao.findListAll();
	}

}
