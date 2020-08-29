package com.nbp.co;

import java.util.List;

public interface CoDAO {

	public List<CoDTO> findAll(int pageNo);

	public List<CoDTO> findlastCo();

	public List<CoDTO> finListAll();
	
	public List<Co2DTO> findAllCo2();
}
