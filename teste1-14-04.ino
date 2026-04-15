#include <Stepper.h>

const int passosPorVolta = 2048;      // Motor 28BYJ-48 = 2048 passos por volta
Stepper motor(passosPorVolta, 4, 6, 5, 7);

void setup() {
  motor.setSpeed(15);  // Velocidade em RPM (mais baixo = mais lento, mais preciso)
}

void loop() {
  for(int i = 0; i < 2; i++) {
    motor.step(3072);      // da 1 volta
    delay(2000); // Espera 2 segundos
    motor.step(-2048);      // da 3 volta 
    delay(2000); // Espera 2 segundos
  }
}
