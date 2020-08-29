package Serial;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;

public class ArduinoSerialListener implements SerialPortEventListener {
	BufferedInputStream arduinoBis;
	OutputStream ArduinoOs;
	SerialConnect arduino;
	InputStream in;
	String RData;
	String dataresult;
	
	ClientArduino clientArduino;
	
	PrintWriter pw;

	public ArduinoSerialListener(BufferedInputStream arduinoBis, SerialConnect arduino, InputStream in, ClientArduino clientArduino) {
		this.arduinoBis = arduinoBis;
		this.arduino = arduino;
		this.in = in;
		this.clientArduino = clientArduino;

	}

	public ArduinoSerialListener(InputStream in,ClientArduino clientArduino) {
		this.in = in;
		this.clientArduino = clientArduino;
	}

	// 데이터가 전송될때마다 호출되는 메소드
	@Override
	public void serialEvent(SerialPortEvent event) {
		int data;
		switch (event.getEventType()) {
		case SerialPortEvent.DATA_AVAILABLE:
			// 데이터가 도착하면 어떻게 할 것인지 정의
			byte[] ArduinoreadBuffer = new byte[1024];
			try {
				int len = 0;
				
				while((data = in.read())>-1) {
					if(data=='\n') {
						break;
					}
					ArduinoreadBuffer[len++] = (byte)data;
				}
				Thread.sleep(1000);
				
				RData = new String(ArduinoreadBuffer,0,len);
				System.out.println(RData);
				clientArduino.sendMessage(RData);
				
			} catch (IOException e) {
				e.printStackTrace();
				System.exit(-1);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

		}

	}


	public void setClientArduino(ClientArduino clientArduino) {
		this.clientArduino = clientArduino;
	}

	public ClientArduino getClientArduino() {
		return clientArduino;
	}
	


	
}
