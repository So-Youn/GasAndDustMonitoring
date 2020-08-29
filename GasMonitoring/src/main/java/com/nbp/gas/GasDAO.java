package com.nbp.gas;

import java.util.List;

public interface GasDAO {

	List<OzoneDTO> findAll(int pageNo);

	List<OzoneDTO> findAll();

	List<OzoneDTO> findlastO3();

	List<No2DTO> findNo2list(int pageNo);

	List<No2DTO> findlastNo2();

	List<No2DTO> findNo2All();

	List<NH3DTO> findNH3All();

}
