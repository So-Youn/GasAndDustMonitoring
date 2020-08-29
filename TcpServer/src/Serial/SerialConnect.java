package Serial;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.TooManyListenersException;



import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.UnsupportedCommOperationException;

public class SerialConnect {

	InputStream in;
	OutputStream out;
	BufferedInputStream bis;
	CommPort commPort;
	ClientArduino clientArduino = new ClientArduino();

	public SerialConnect() {
		super();
	}

	public void connect(String portName, String appName) {
		try {
			CommPortIdentifier commPortIdentifier = CommPortIdentifier.getPortIdentifier(portName);
			if (commPortIdentifier.isCurrentlyOwned()) {
				System.out.println("포트를 사용할 수 없습니다.");
			} else {
				System.out.println("포트 사용 가능");
				clientArduino.connect();
				
			}
			commPort = commPortIdentifier.open(appName, 5000);
			// 매개변수1 : 포트를 열고 사용하는 프로그램의 이름(문자열)
			// 매개변수2 : 포트를 열고 통신하기 위해서 기다리는 시간(밀리세컨드)
			System.out.println(commPort);
			if (commPort instanceof SerialPort) {
				System.out.println("SerialPort");
				SerialPort serialPort = (SerialPort) commPort;
				serialPort.setSerialPortParams(9600, // 통신속도
						SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
				in = serialPort.getInputStream();
				bis = new BufferedInputStream(in);
				out = serialPort.getOutputStream();
				serialPort.addEventListener(new ArduinoSerialListener(in,clientArduino));
				serialPort.notifyOnDataAvailable(true);
				
			} else {
				System.out.println("Serial포트만 작업할 수 있습니다.");
			}
		} catch (NoSuchPortException e) {
			e.printStackTrace();
		} catch (PortInUseException e) {
			e.printStackTrace();
		} catch (UnsupportedCommOperationException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TooManyListenersException e) {
			e.printStackTrace();
		}
	}


	public static void main(String[] args) {
		try {
			(new SerialConnect()).connect("COM4","Arduino");
			(new SerialConnect()).connect("COM5","Arduino");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public InputStream getIn() {
		return in;
	}

	public OutputStream getOut() {
		return out;
	}

	public BufferedInputStream getBis() {
		return bis;
	}

	public CommPort getCommPort() {
		return commPort;
	}
 


}
