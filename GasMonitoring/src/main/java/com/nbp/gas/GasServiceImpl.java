package com.nbp.gas;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("GasService")
public class GasServiceImpl implements GasService{
	@Autowired
	GasDAO dao;
	
	@Override
	public List<OzoneDTO> findAll(int pageNo) {
		return dao.findAll(pageNo);
	}
	
	@Override
	public List<OzoneDTO> findlastO3() {
		return dao.findlastO3();
	}

	@Override
	public List<OzoneDTO> findAll() {
		return dao.findAll();
	}

	@Override
	public List<No2DTO> findNo2list(int pageNo) {
		return dao.findNo2list(pageNo);
	}

	@Override
	public List<No2DTO> findlastNo2() {
		return dao.findlastNo2();
	}

	@Override
	public List<No2DTO> findNo2All() {
		return dao.findNo2All();
	}

	@Override
	public List<NH3DTO> findNh3All() {
		return dao.findNH3All();
	}


	
	
}
