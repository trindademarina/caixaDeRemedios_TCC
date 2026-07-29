#include <VarSpeedServo.h>

VarSpeedServo servo;

void setup() {
  servo.attach(9);
  servo.write(0); //posição inicial de config
  delay(2000);
}

void loop() {
  servo.slowmove(90,30); //angulo,velocidade
  delay(3000);
  servo.write(0); //volta pra posição inicial | no projeto, retoma para a posição inicial, a partir de um comando do cliente 
  delay(3000);

}
