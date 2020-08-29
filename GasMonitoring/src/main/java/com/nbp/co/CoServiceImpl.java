package com.nbp.co;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("CoService")
public class CoServiceImpl implements CoService{
	@Autowired
	CoDAO dao;
	
	@Override
	public List<CoDTO> findAll(int pageNo) {
		return dao.findAll(pageNo);
	}

	@Override
	public List<CoDTO> findlastCo() {
		return dao.findlastCo();
	}

	@Override
	public List<CoDTO> findAll() {
		return dao.finListAll();
	}

	@Override
	public List<Co2DTO> findAllCo2() {
		return dao.findAllCo2();
	}


}
