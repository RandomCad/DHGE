// Geom. Objekte: Vererbung und "clone"
// Hauptprogramm
//
// Aufruf: main
//
// Klaus Kusche, 2020

#include <cstdlib>
#include <ctime>

#include "../SDL/sdlinterf.h"

#include "color.h"
#include "graobj.h"
#include "rect.h"
#include "circ.h"

using namespace std;

const int snakes = 500;  // Anzahl der Schlangen
const int length = 14;  // Anzahl der Rechtecke / Kreise pro Schlange
const int objCnt = snakes * length;  // Gesamtzahl der Objekte
int Color::sColorCount=0;

// Zur Wahl einer zuf�lligen Geschwindigkeit, die nicht 0 ist:
// Berechne eine Zufallszahl z von -n ... -1 oder 1 ... n (aber nicht 0)
inline int randPM(int n)
{
  return ((rand() % n) + 1) - ((rand() % 2) * (n + 1));
}

// Erzeuge zuf�llig ein dynamisch angelegtes Rect- oder Circ-Objekt,
// (liefert einen Pointer auf das neue Objekt)
GraObj *mkGraObj()
{
  if (rand() % 2 == 0) {
    return new Rect(
          Color(),
          SDL_X_SIZE / 2, SDL_Y_SIZE / 2,
          10, 10, randPM(7), randPM(7));
  } else {
    return new Circ(
          Color(),
          SDL_X_SIZE / 2, SDL_Y_SIZE / 2,
          13, 13, randPM(7), randPM(7));
  }
}

int main(void)
{
  srand(time(nullptr));
  sdlInit();

  // die Array-Elemente m�ssen wahlweise auf Rect's oder Circ's zeigen k�nnen
  // ==> mit der gemeinsamen Basisklasse deklarieren
  GraObj *obj[objCnt];

  for (int i = 0; i < objCnt; ++i) {
    if (i % length == 0) {
      // neue Schlange beginnen, mit gleicher Wahrscheinlichkeit Rect oder Circ
      obj[i] = mkGraObj();
    } else {
      // bestehende Schlange verl�ngern: Voriges Objekt kopieren ...
      obj[i] = obj[i - 1]->clone();
      // ... und verschieben
      obj[i]->move(3 * obj[i]->getSX(), 3 * obj[i]->getSY());
    }
  }

  // Objekte endlos herumfliegen lassen
  for (;;) {
    GraObj::drawAll();
    sdlUpdate();
    sdlMilliSleep(20);
    for (int i = 0; i < objCnt; ++i) {
      obj[i]->fly(true);
    }
  }

  sdlExit();

  exit(EXIT_SUCCESS);
}
