package com.nbp.co;

import java.util.List;

public interface CoService{

	public List<CoDTO> findAll(int pageNo);

	public List<CoDTO> findlastCo();

	public List<CoDTO> findAll();
	
	
	public List<Co2DTO> findAllCo2();

	

}
