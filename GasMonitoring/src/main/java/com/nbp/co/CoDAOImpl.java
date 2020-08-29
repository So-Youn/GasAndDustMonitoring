package com.nbp.co;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

@Repository("coDao")
public class CoDAOImpl implements CoDAO {
	@Autowired
	CoRepository coRepository;
	
	@Autowired
	Co2Repository co2Repository;
	
	@Autowired
	MongoTemplate mongoTemplate;
	
	@Override
	public List<CoDTO> findAll(int pageNo) {
		
		Page<CoDTO> pagelist = coRepository.findAll(new PageRequest(pageNo, 10, Sort.Direction.DESC, "time"));
		List<CoDTO> colist = pagelist.getContent();
		System.out.println(colist);
		return colist;
	}

	@Override
	public List<CoDTO> findlastCo() {
		List<CoDTO> lastCo = (List<CoDTO>)(coRepository.findAll(new Sort(Sort.Direction.DESC, "time")));
		return lastCo;
	}

	@Override
	public List<CoDTO> finListAll() {
		List<CoDTO> lastCo = (List<CoDTO>)(coRepository.findAll(new Sort(Sort.Direction.DESC, "time")));
		return lastCo;
	}

	@Override
	public List<Co2DTO> findAllCo2() {
		List<Co2DTO> co2list = (List<Co2DTO>)(co2Repository.findAll(new Sort(Sort.Direction.DESC, "time")));
		return co2list;
	}


}
