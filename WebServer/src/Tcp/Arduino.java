package Tcp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.StringTokenizer;
import java.util.Vector;

import Mongo.MongoClass;

public class Arduino extends Thread {
	Socket client;

	InputStream is;
	InputStreamReader isr;
	BufferedReader br;

	OutputStream os;
	PrintWriter pw;

	String message;
	Vector<Arduino> arduinolist;

	StringTokenizer st;
	MongoClass mongo;

	String Hum,Temp;
	String Coppm;
	String volts,Co2Ppm;
	String o3_ppm,o3_mgppm;
	String No2ppm,So2ppm;
	String Nh3_ppm,Nh3_volts;
	public Arduino() {
		System.out.println("기본 생성자");
	}

	public Arduino(Socket client, Vector<Arduino> arduinolist, MongoClass mongo) {
		super();
		this.client = client;
		this.arduinolist = arduinolist;
		this.mongo = mongo;
		ioWork();

	}

	private void ioWork() {
		try {
			is = client.getInputStream();
			isr = new InputStreamReader(is);
			br = new BufferedReader(isr);

			os = client.getOutputStream();
			pw = new PrintWriter(os, true);
			System.out.println("Arduino 접속 성공!");
			arduinolist.add(this);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void sendMsg(String msg) {
		pw.println(msg);
	}

	private void filteringMsg(String msg) {
		if (!msg.equals("")) {
			System.out.println("서버가 받은 클라이언트의 메시지" + msg);
			st = new StringTokenizer(msg, "/");
			String protocol = st.nextToken();
			if (protocol.equals("DHT11")) {
				if (st.hasMoreTokens()) {
					Hum = st.nextToken();
					Temp = st.nextToken();
					mongo.dht11(Hum, Temp);
				}
			} else if (protocol.equals("CO")) {
				if (st.hasMoreTokens()) {
					Coppm = st.nextToken();
					mongo.CoPPM(Coppm);
				}
			} else if (protocol.equals("CO2")) {
				if(st.hasMoreTokens()) {
					volts = st.nextToken();
					Co2Ppm = st.nextToken();
					mongo.Co2PPM(volts,Co2Ppm);
				}
			} else if(protocol.equals("O3")) {
				if(st.hasMoreTokens()) {
					o3_ppm = st.nextToken();
					o3_mgppm =st.nextToken();
					mongo.O3PPM(o3_ppm,o3_mgppm);
				}
			} else if(protocol.equals("NO2")) {
				if(st.hasMoreTokens()) {
					No2ppm = st.nextToken();
					mongo.No2PPM(No2ppm);
				}
			} else if(protocol.equals("NH3")) {
				if(st.hasMoreTokens()) {
					Nh3_ppm = st.nextToken();
					Nh3_volts = st.nextToken();
					mongo.Nh3PPM(Nh3_ppm,Nh3_volts);
				}
			}
		}

	}

	public void run() {
		while (true) {
			try {
				String msg = br.readLine();
				if (!msg.equals("")) {
					//System.out.println("Arduino에서 받은 센서 값: " + msg);
					filteringMsg(msg);
				}
			} catch (IOException e) {
				System.out.println("---Arduino와의 연결 실패!---");
				e.printStackTrace();
				try {
					is.close();
					isr.close();
					br.close();
					os.close();
					pw.close();
					client.close();
				} catch (IOException e2) {
					e.printStackTrace();
				}
			}

		}
	}
}
