package Serial;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.StringTokenizer;

public class ClientArduino {
	Socket socket;
	InputStream is;
	InputStreamReader isr;
	BufferedReader br;

	OutputStream os;
	PrintWriter pw;
	StringTokenizer st;

	ArduinoSerialListener arduinoSerialListener;

	public ClientArduino() {
		super();
	}

	public ClientArduino(ArduinoSerialListener arduinoSerialListener) {
		this.arduinoSerialListener = arduinoSerialListener;

	}

	public void connect() {
		try {
			socket = new Socket("10.74.28.47", 12345);
			System.out.println("접속 성공");
			if (socket != null) {
				ioWork();
			}
			Thread thread = new Thread(new Runnable() {

				@Override
				public void run() {
					while (true) {
						String msg;
						try {
							msg = br.readLine();
							System.out.println("서버로부터 수신된 메시지>>" + msg);
							filteringMsg(msg);
						} catch (IOException e) {
							try {
								is.close();
								isr.close();
								br.close();
								os.close();
								pw.close();
								socket.close();
							} catch (IOException e1) {
								System.out.println("연결 끊김");
								e1.printStackTrace();
							}

							break;
						}

					}

				}

			});
			thread.start();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void filteringMsg(String msg) {

	}

	private void ioWork() {
		try {
			is = socket.getInputStream();
			isr = new InputStreamReader(is);
			br = new BufferedReader(isr);

			os = socket.getOutputStream();
			pw = new PrintWriter(os, true);
			pw.println("Arduino");
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void sendMessage(String RData) {
		// System.out.println("센서값 받음"+RData);
		new Thread(new Runnable() {

			@Override
			public void run() {
				st = new StringTokenizer(RData, "/");
				String sensor = st.nextToken();
				if (st.hasMoreTokens()) {
					String message = st.nextToken();
					// System.out.println("센서"+sensor+",값"+message);
					if (!RData.equals("")) {
						if (sensor.equals("DHT11")) {
							if (message != null) {
								pw.println(RData);
								pw.flush();
							}
						} else if (sensor.equals("CO")) {
							if (message != null) {
								pw.println(RData);
								pw.flush();
							}
						} else if (sensor.equals("CO2")) {
							if (message != null) {
								pw.println(RData);
								pw.flush();
							}
						} else if (sensor.equals("O3")) {
							if (message != null) {
								pw.println(RData);
								pw.flush();
							}
						} else if (sensor.equals("NO2")) {
							if (message != null) {
								pw.println(RData);
								pw.flush();
							}
						} else if(sensor.equals("NH3")) {
							if (message != null) {
								pw.println(RData);
								pw.flush();
							}
						}
					}
				}
			}
		}).start();

	}
}
