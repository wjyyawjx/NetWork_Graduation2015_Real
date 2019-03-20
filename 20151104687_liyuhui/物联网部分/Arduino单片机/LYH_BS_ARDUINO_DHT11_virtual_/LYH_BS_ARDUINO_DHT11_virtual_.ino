#include <dht11.h>
dht11 DHT11;
#define DHT11PIN 7
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  for (int i = 0; i < 3; i++) {
    int chk = DHT11.read(DHT11PIN);
    switch (i) {
      case (0): Serial.println("1208:"); break;
      case (1): Serial.println("1210:"); break;
      case (2): Serial.println("1214:"); break;
    }
    Serial.print("Hum:");
    Serial.print((float)DHT11.humidity, 2);
    Serial.print(",Tem:");
    Serial.print((float)DHT11.temperature, 2);
    //delay(60000);
    delay(1000);
  }
}
