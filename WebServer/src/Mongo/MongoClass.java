package Mongo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;

public class MongoClass {
	DB database;
	MongoClient mongoClient;
	BasicDBObject document;
	
	BasicDBObject timeNow;
	DBCollection collection;

	

	public MongoClass() {
		mongoClient = new MongoClient("localhost", 27017);
		database = mongoClient.getDB("SensorDB");
	}


	
	public void dht11(String Hum, String Temp) {
		database.createCollection("DHT11", null);
		collection = database.getCollection("DHT11");
		document = new BasicDBObject();
		document.put("Temp", Integer.parseInt(Temp));
		document.put("Hum", Integer.parseInt(Hum));
		document.put("time", TimeSet());
		collection.insert(document);
	}
	
	public String TimeSet() {
		Date now = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		TimeZone time = TimeZone.getTimeZone("Asia/Seoul");
		df.setTimeZone(time);
		return df.format(now);
	}

	public void CoPPM(String ppm) {
		database.createCollection("CO", null);
		collection = database.getCollection("CO");
		document = new BasicDBObject();
		document.put("ppm", ppm);
		document.put("time", TimeSet());
		collection.insert(document);
	}

	public void Co2PPM(String volts, String co2Ppm) {
		database.createCollection("CO2", null);
		collection = database.getCollection("CO2");
		document = new BasicDBObject();
		document.put("volts", volts);
		document.put("ppm", co2Ppm);
		document.put("time", TimeSet());
		collection.insert(document);
		
	}

	public void O3PPM(String o3_ppm, String o3_mgppm) {
		database.createCollection("O3", null);
		collection = database.getCollection("O3");
		document = new BasicDBObject();
		document.put("ppm", o3_ppm);
		document.put("mg_ppm", o3_mgppm);
		document.put("time", TimeSet());
		collection.insert(document);
	}

	public void No2PPM(String no2ppm) {
		database.createCollection("NO2", null);
		collection = database.getCollection("NO2");
		document = new BasicDBObject();
		document.put("ppm", no2ppm);
		document.put("time", TimeSet());
		collection.insert(document);
	}



	public void Nh3PPM(String nh3_ppm, String nh3_volts) {
		database.createCollection("NH3", null);
		collection = database.getCollection("NH3");
		document = new BasicDBObject();
		document.put("ppm", nh3_ppm);
		document.put("volts", nh3_volts);
		document.put("time", TimeSet());
		collection.insert(document);
	}




	

}
