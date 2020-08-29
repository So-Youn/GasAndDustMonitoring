package com.nbp.gas;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="O3")
public class OzoneDTO {
	@Id
	String _id;
	String ppm;
	String mg_ppm;
	String time;
	
	public OzoneDTO() {
		
	}

	public OzoneDTO(String _id, String ppm, String mg_ppm, String time) {
		super();
		this._id = _id;
		this.ppm = ppm;
		this.mg_ppm = mg_ppm;
		this.time = time;
	}

	@Override
	public String toString() {
		return "OzoneDTO [_id=" + _id + ", ppm=" + ppm + ", mg_ppm=" + mg_ppm + ", time=" + time + "]";
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

	public String getMg_ppm() {
		return mg_ppm;
	}

	public void setMg_ppm(String mg_ppm) {
		this.mg_ppm = mg_ppm;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	
}
