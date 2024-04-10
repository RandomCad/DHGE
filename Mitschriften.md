# Mitschriften
## Embeded 1
Basisi is der arduino.  

In tinkercad ist es möglich eine simulation fom Arduino zu machen.  
### 10.04.2024
![](Immages/DoubleLED.png)
Mit dem nachfolgenden code ermöglicht dies das abwechselnde Blincken fon 2 LED's.  
```
// C++ code
//
void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop()
{
  /*one led
  //First LED
  digitalWrite(A0, HIGH);
  delay(1000); // Wait for 1000 millisecond(s)
  digitalWrite(A0, LOW);
  delay(1000); // Wait for 1000 millisecond(s)*/
  
  //Second LED
  digitalWrite(A1, LOW);
  digitalWrite(A0, HIGH);
  delay(1000); // Wait for 1000 millisecond(s)
  digitalWrite(A1, HIGH);
  digitalWrite(A0, LOW);
  delay(1000); // Wait for 1000 millisecond(s)
}
```

###Basis Arduino Programmierung
Es gibt die `setup` und `loop` methoden in der IDE. `Setup` wird ausgeführt, wenn der Arduino hochfährt. Danach wird in einem `while(true)` loop die `loop` funktion ausgeführt.
### Prüfung
Klausurleistung inerhalb der Vorlesung.  
Ein Programm soll geschreiben werden. Mit zugehöriger doku. Zusätzlich müssen diese erklärt werden und fragen zum Code erklärt werden.  


#Ideen
## Kipfenster Roboter

