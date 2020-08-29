package com.nbp.temp;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="DHT11")
public class TempDTO {
	@Id
	String _id;
	int Temp;
	int Hum;
	String time;
	
	public TempDTO() {
		
	}

	
	
	
	public TempDTO(String _id, int temp, int hum, String time) {
		super();
		this._id = _id;
		this.Temp = temp;
		this.Hum = hum;
		this.time = time;
	}




	@Override
	public String toString() {
		return "TempDTO [_id=" + _id + ", Temp=" + Temp + ", Hum=" + Hum + ", time=" + time + "]";
	}




	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public int getTemp() {
		return Temp;
	}

	public void setTemp(int temp) {
		Temp = temp;
	}

	public int getHum() {
		return Hum;
	}

	public void setHum(int hum) {
		Hum = hum;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	


	
	
	
		
	}
