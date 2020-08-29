package com.nbp.temp;

import org.springframework.data.repository.PagingAndSortingRepository;

public interface TempRepository  extends PagingAndSortingRepository<TempDTO, String>{ //기본키 타입 명시
	
}
