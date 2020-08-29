package com.nbp.gas;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="NH3")
public class NH3DTO {
	@Id
	String _id;
	String ppm;
	String volts;
	String time;
	
	public NH3DTO() {
		
	}

	
	
	public NH3DTO(String _id, String ppm, String volts, String time) {
		super();
		this._id = _id;
		this.ppm = ppm;
		this.volts = volts;
		this.time = time;
	}



	@Override
	public String toString() {
		return "NH3DTO [_id=" + _id + ", ppm=" + ppm + ", volts=" + volts + ", time=" + time + "]";
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



	public String getVolts() {
		return volts;
	}



	public void setVolts(String volts) {
		this.volts = volts;
	}



	public String getTime() {
		return time;
	}



	public void setTime(String time) {
		this.time = time;
	}
	
	
}
