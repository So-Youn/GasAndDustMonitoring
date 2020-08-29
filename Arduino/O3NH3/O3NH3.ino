//NH3 변수 선언
#define RL 47  //The value of resistor RL is 47K
#define m -0.263 //Enter calculated Slope 
#define b 0.42 //Enter calculated intercept
#define Ro 20 //Enter found Ro value
#define MQ_sensor A0 //Sensor is connected to A4


#include "MQ131.h"
//#include "ULP.h"
// Init the sensor
// - Heater control on pin 2
// - Sensor analog read on pin A2
// - Model LOW_CONCENTRATION
MQ131 sensor(2,A2, LOW_CONCENTRATION, 10000);

//led
int red = 9;
int green = 10;
int blue = 11;


void setup() {
  Serial.flush();
  Serial.begin(9600);
  Serial.println("heating start");
  sensor.calibrate();
  Serial.print("getTimeToRead");
  Serial.println(sensor.getTimeToRead());
  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);
}

void loop() {
  //오존 측정
  sensor.begin();
  Serial.print("O3/");
  Serial.print(sensor.getO3(PPM));
  Serial.print("/");
  Serial.println(sensor.getO3(MG_M3));  
  
  //NH3 측정
  float VRL; //Voltage drop across the MQ sensor
  float Rs; //Sensor resistance at gas concentration 
  float ratio; //Define variable for ratio
   
  VRL = analogRead(MQ_sensor)*(5.0/1023.0); //Measure the voltage drop and convert to 0-5V
  Rs = ((5.0*RL)/VRL)-RL; //Use formula to get Rs value
  ratio = Rs/Ro;  // find ratio Rs/Ro
 
  float ppm = pow(10, ((log10(ratio)-b)/m)); //use formula to calculate ppm
  Serial.print("NH3/");
  Serial.print(ppm);
  Serial.print("/");
  Serial.print(VRL);
  Serial.println("");

  delay(1000);
}
