package com.nbp.gas;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="NO2")
public class No2DTO {
	@Id
	String _id;
	String ppm;
	String time;
	
	public No2DTO() {
		
	}

	public No2DTO(String _id, String ppm, String time) {
		super();
		this._id = _id;
		this.ppm = ppm;
		this.time = time;
	}

	@Override
	public String toString() {
		return "No2DTO [_id=" + _id + ", ppm=" + ppm + ", time=" + time + "]";
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
