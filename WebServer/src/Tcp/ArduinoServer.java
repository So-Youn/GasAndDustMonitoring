/**
 * 
 */
package Tcp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

import Mongo.MongoClass;

/**
 * 아두이노 서버 - 웹 tcp 서버
 *
 */
public class ArduinoServer {
	ServerSocket server;
	Socket client;
	BufferedReader br;
	Vector<Arduino> arduinolist = new Vector<Arduino>();
	MongoClass mongo;
	public static void main(String[] args) {
		new ArduinoServer().serverStart();

	}

	public void serverStart() {
		try {
			server = new ServerSocket(12345);
			if (server != null) {
				connection();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void connection() {
		new Thread(new Runnable() {

			@Override
			public void run() {
				while (true) {
					try {
						client = server.accept();
						String ip = client.getInetAddress().getHostAddress();
						System.out.println(ip + "접속");
						br = new BufferedReader(new InputStreamReader(client.getInputStream()));
						String msg = br.readLine();
						System.out.println("접속 상대>>" + msg);
						if (msg.equals("Arduino")) {
							mongo = new MongoClass();
							Arduino arduino = new Arduino(client, arduinolist,mongo);
							arduino.start();
						}
						
					} catch (IOException e) {
						e.printStackTrace();
					}

				}
			}

		}).start();

	}

}
