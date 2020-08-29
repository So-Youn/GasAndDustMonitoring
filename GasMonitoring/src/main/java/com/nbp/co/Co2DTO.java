package com.nbp.co;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="CO2")
public class Co2DTO {
	@Id
	String _id;
	String ppm;
	String time;
	Boolean warning;
	
	public Co2DTO() {
		
	}

	public Co2DTO(String _id, String ppm, String time, Boolean warning) {
		super();
		this._id = _id;
		this.ppm = ppm;
		this.time = time;
		this.warning = warning;
	}

	@Override
	public String toString() {
		return "Co2DTO [_id=" + _id + ", ppm=" + ppm + ", time=" + time + ", warning=" + warning + "]";
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

	public Boolean getWarning() {
		return warning;
	}

	public void setWarning(Boolean warning) {
		this.warning = warning;
	}
	
	
	
}
