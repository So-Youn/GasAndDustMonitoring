package com.nbp.co;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="CO")
public class CoDTO {
	@Id
	String _id;
	String ppm;
	String time;
	
	public CoDTO() {
		
	}

	public CoDTO(String _id, String ppm, String time) {
		super();
		this._id = _id;
		this.ppm = ppm;
		this.time = time;
	}

	@Override
	public String toString() {
		return "CoDTO [_id=" + _id + ", ppm=" + ppm + ", time=" + time + "]";
	}

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getPpm() {
		return ppm;
	}

	public void setPpm(String ppm) {
		this.ppm = ppm;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	
	
	
	


	
	
	
		
	}
