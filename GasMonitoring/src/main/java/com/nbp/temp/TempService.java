package com.nbp.temp;

import java.util.List;

public interface TempService{

	public List<TempDTO> findAll(int pageNo);

	public List<TempDTO> findlastTemp();

	public List<TempDTO> findAll();

}
