#include <Servo.h>

Servo servo;

void setup() {
  servo.attach(9);
  servo.write(45);
  delay(300);
  servo.write(90);


  
}

void loop() {
}
