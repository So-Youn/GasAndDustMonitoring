//온습도 센서
#include <dht11.h>
dht11 DHT;
#define DHT11_PIN A4
//CO 측정 센서
#include "MQ7.h"
MQ7 mq7(A2,5.0);


//CO2 측정 센서
#define         MG_PIN                       (A0)     //define which analog input channel you are going to use
#define         BOOL_PIN                     (2)
#define         DC_GAIN                      (8.5)   //define the DC gain of amplifier

/***********************Software Related Macros************************************/
#define         READ_SAMPLE_INTERVAL         (50)    //define how many samples you are going to take in normal operation
#define         READ_SAMPLE_TIMES            (5)     //define the time interval(in milisecond) between each samples in
                                                     //normal operation

/**********************Application Related Macros**********************************/
#define         ZERO_POINT_VOLTAGE           (0.452) //define the output of the sensor in volts when the concentration of CO2 is 400PPM
#define         REACTION_VOLTGAE             (0.280) //define the voltage drop of the sensor when move the sensor from air into 1000ppm CO2
#define         MAX_POINT_VOLTAGE            (0.371)
/*****************************Globals***********************************************/
float           CO2Curve[3]  =  {2.602,ZERO_POINT_VOLTAGE,(REACTION_VOLTGAE/(2.602-3))};

//No2 측정
#include "ULP.h"
const int C1 = A1;
const int T1 = A3;
float no2;
const float Sf1 = 5.05; 

float temp1;
float TZero;
float Vzero1;
NO2 sensor1(C1, T1, Sf1); 

//led
int red = 5;
int green = 6;
int blue = 7;


void setup(){
  Serial.flush();
  Serial.begin(9600);
  sensor1.zero();
  pinMode(BOOL_PIN, INPUT);                        //set pin to input
  digitalWrite(BOOL_PIN, HIGH);                    //turn on pullup resistors
  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);
}

void loop(){

  int chk;

  
  Serial.print("DHT11/");
  chk = DHT.read(DHT11_PIN);    // READ DATA
  switch (chk){
    case DHTLIB_OK:  
                // DISPLAT DATA
                Serial.print(DHT.humidity,1);
                Serial.print("/");
                Serial.println(DHT.temperature,1);
                break;
    case DHTLIB_ERROR_CHECKSUM: 
                break;
    case DHTLIB_ERROR_TIMEOUT: 
                break;
    default: 
                break;
  }
  
  //CO 센서
  Serial.print("CO/");
  Serial.println(mq7.getPPM());
  
  //CO2 센서
  int percentage;
  float volts;

  volts = MGRead(MG_PIN);
  Serial.print("CO2/");
  Serial.print(volts);
  Serial.print("/");
  percentage = MGGetPercentage(volts,CO2Curve);
  if (percentage == -1) {
      Serial.println( 400 );
  } else {
      Serial.println(percentage);
   }
  no2 = sensor1.getConc(1,sensor1.getTemp(1));
  Serial.print("NO2/");
  Serial.println(abs(no2)); 
  if (abs(no2) > 0.1){
    digitalWrite(red, HIGH);
    delay(500);
    
    digitalWrite(red, LOW);
  }  

  delay(5000);
}

//  This function reads the output of SEN-000007(co2)
float MGRead(int mg_pin)
{
    int i;
    float v=0;

    for (i=0;i<READ_SAMPLE_TIMES;i++) {
        v += analogRead(mg_pin);
        delay(READ_SAMPLE_INTERVAL);
    }
    v = (v/READ_SAMPLE_TIMES) *5/1024 ;
    return v;
}

// Input:   volts   - SEN-000007 output measured in volts
//         pcurve  - pointer to the curve of the target gas
// Output:  ppm of the target gas

int  MGGetPercentage(float volts, float *pcurve)
{
   if ((volts/DC_GAIN )>=ZERO_POINT_VOLTAGE) {
      return -1;
   } else {
      return pow(10, ((volts/DC_GAIN)-pcurve[1])/pcurve[2]+pcurve[0]);
   }
}
