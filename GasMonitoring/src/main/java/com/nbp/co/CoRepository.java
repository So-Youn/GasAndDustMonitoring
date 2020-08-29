package com.nbp.co;

import org.springframework.data.repository.PagingAndSortingRepository;

public interface CoRepository  extends PagingAndSortingRepository<CoDTO, String>{ //기본키 타입 명시
	
}
