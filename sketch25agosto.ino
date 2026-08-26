#include <VarSpeedServo.h>

VarSpeedServo servo1;
VarSpeedServo servo2;
VarSpeedServo servo3;
VarSpeedServo servo4;
VarSpeedServo servo5;
VarSpeedServo servo6;
VarSpeedServo servo7;

void setup() {
   Serial.begin(9600);

  servo1.attach(2); //domingo
  servo2.attach(3); //segunda
  servo3.attach(4); //terça
  servo4.attach(5); //quarta
  servo5.attach(6); //quinta
  servo6.attach(7); //sexta
  servo7.attach(8); //sabado

  servo1.write(0);
  servo2.write(0);
  servo3.write(0);
  servo4.write(0);
  servo5.write(0);
  servo6.write(0);
  servo7.write(0);

  delay(2000);
}

void loop() {

      servo4.write(90); //angulo, abre
      delay(3000);
  
      servo4.slowmove(0,30); // angulo/velocidade - volta pra posição inicial | no projeto, retoma para a posição inicial, a partir de um comando do cliente 
      delay(3000);
    }
  
