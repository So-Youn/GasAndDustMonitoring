package com.nbp.temp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

@Repository("tempDao")
public class TempDAOImpl implements TempDAO {
	@Autowired
	TempRepository tempRepository;
	
	@Autowired
	MongoTemplate mongoTemplate;
	
	@Override
	public List<TempDTO> findAll(int pageNo) {
		
		Page<TempDTO> pagelist = tempRepository.findAll(new PageRequest(pageNo, 10, Sort.Direction.DESC, "time"));
		List<TempDTO> templist = pagelist.getContent();
		System.out.println(templist);
		return templist;
	}

	@Override
	public List<TempDTO> findlastTemp() {
		
		List<TempDTO> lastTemp = (List<TempDTO>)(tempRepository.findAll(new Sort(Sort.Direction.DESC, "time")));
		
		return lastTemp;
	}

	@Override
	public List<TempDTO> findListAll() {
		List<TempDTO> tempListAll = (List<TempDTO>)(tempRepository.findAll(new Sort(Sort.Direction.DESC, "time")));
		return tempListAll;
	}

}
