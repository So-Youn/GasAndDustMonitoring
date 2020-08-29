package com.nbp.gas;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

@Repository("gasDao")
public class GasDAOImpl implements GasDAO{
	@Autowired
	OzoneRepository ozoneRepository;
	
	@Autowired
	No2Repository no2Repository;
	
	@Autowired
	NH3Repository nh3Repository;
	
	@Autowired
	MongoTemplate mongoTemplate;

	@Override
	public List<OzoneDTO> findAll(int pageNo) {
		Page<OzoneDTO> pagelist = ozoneRepository.findAll(new PageRequest(pageNo, 10, Sort.Direction.DESC, "time"));
		List<OzoneDTO> o3list = pagelist.getContent();
		return o3list;
	}

	@Override
	public List<OzoneDTO> findAll() {
		List<OzoneDTO> o3ListAll = (List<OzoneDTO>)(ozoneRepository.findAll(new Sort(Sort.Direction.DESC, "time")));
		return o3ListAll;
	}

	@Override
	public List<OzoneDTO> findlastO3() {
		List<OzoneDTO> LastO3 = (List<OzoneDTO>)(ozoneRepository.findAll(new Sort(Sort.Direction.DESC, "time")));
		return LastO3;
	}

	@Override
	public List<No2DTO> findNo2list(int pageNo) {
		Page<No2DTO> pagelist = no2Repository.findAll(new PageRequest(pageNo, 10, Sort.Direction.DESC, "time"));
		List<No2DTO> No2list = pagelist.getContent();
		return No2list;
	}

	@Override
	public List<No2DTO> findlastNo2() {
		List<No2DTO> LastNo2 = (List<No2DTO>)(no2Repository.findAll(new Sort(Sort.Direction.DESC, "time")));
		return LastNo2;
	}

	@Override
	public List<No2DTO> findNo2All() {
		List<No2DTO> No2ListAll = (List<No2DTO>)(no2Repository.findAll(new Sort(Sort.Direction.DESC, "time")));
		return No2ListAll;
	}

	@Override
	public List<NH3DTO> findNH3All() {
		List<NH3DTO> Nh3ListAll = (List<NH3DTO>)(nh3Repository.findAll(new Sort(Sort.Direction.DESC, "time")));
		return Nh3ListAll;
	}
	
	

}
