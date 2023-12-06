// Travelling Salesman mittels Backtracking, grafisch
//
// Aufruf: travel anzahl
//
// Klaus Kusche, 2020

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include "sdlinterf.h"

// Gr��e des "Landes" in x- und y-Richtung, in Pixeln
// Rundherum lassen wir 10 Pixel Rand
#define RAND 10
#define BREITE (SDL_X_SIZE - 2 * RAND)
#define HOEHE (SDL_Y_SIZE - 2 * RAND)

// f�r die Grafik-Ausgabe: Farb-Komponenten f�r St�dte und die Linien
#define STADT_R 255
#define STADT_G 255
#define STADT_B 255
#define ROUTE_R 255
#define ROUTE_G 255
#define ROUTE_B 0
#define VERB_R 0
#define VERB_G 0
#define VERB_B 255

// Pixel-Koordinaten einer Stadt
typedef struct {
  int x, y;
} koord_t;

// Maximale Anzahl der St�dte
// (angelegte Gr��e der Arrays)
#define MAX_ANZ 100

// Mindest-Anzahl der Verbindungen pro Stadt
// Regelt, wie "dicht" der Graph wird
// Sehr hohe Zahl, z.B. 100 ==> Full Graph (alle m�glichen Verbindungen)
// Sehr kleine Zahl, z.B. 3 ==> Oft keine Rundreise m�glich
#define MIN_VERB 5

// Tats�chliche Anzahl der St�dte
// (tats�chlich benutzte Elemente in den Arrays)
int anzahl;

// Koordinaten der i-ten Stadt
koord_t koord[MAX_ANZ];

// Entfernungs-Matrix: Entfernung von i-ter zu j-ter Stadt
// HUGE_VAL (aus math.h) = "unendlich" = keine Verbindung
// Die Matrix ist symmetrisch:
// Es gilt f�r alle Elemente entf[von][nach] == entf[nach][von]
double entf[MAX_ANZ][MAX_ANZ];

// Reihenfolge der St�dte in der Route:
// Index i der Elemente = Nummer der Stadt
// Wert der Elemente = Nummer des Schrittes, in dem diese Stadt besucht wurde:
// Mit dem wievielten Schritt wurde diese Stadt erreicht?
// Wert -1 steht f�r "Stadt ist noch nicht besucht"
// 
// ... bei der aktuellen Route?
int akt_reihenf[MAX_ANZ];
// ... bei der bisher optimalen Route?
int opt_reihenf[MAX_ANZ];

// L�nge der bisher besten Route
// Solange HUGE_VAL: Bisher keine Route gefunden, opt_reihenf noch undefiniert
double optimum = HUGE_VAL;

void suche(int schritt, int stadt, double summe);
void erzeuge_karte(void);
void zeichne_lsg(void);

// Die rekursive L�sungsfunktion:
// Du stehst nach Schritt Nummer "schritt" in der Stadt Nummer "stadt"
// Deine bisherige Fahrtstrecke ist "summe" lang
// Probiere alle M�glichkeiten f�r den n�chsten Schritt
// (= die n�chste Stadt ausgehend von Stadt Nummer "stadt")
void suche(int schritt, int stadt, double summe)
{
  // Schreiben!!!
}

// Bef�lle die Stadt- und Verbindungs-Arrays
// Zeichne die St�dte und Verbindungen
void erzeuge_karte(void)
{
  // St�dte erzeugen
  for (koord_t *a = koord; a < koord + anzahl; ++a) {
    int x = rand() % BREITE + RAND;
    int y = rand() % HOEHE + RAND;
    sdlDrawLine(x - 2, y - 2, x + 2, y + 2, STADT_R, STADT_G, STADT_B);
    sdlDrawLine(x - 2, y + 2, x + 2, y - 2, STADT_R, STADT_G, STADT_B);
    a->x = x; a->y = y;
  }
  sdlUpdate();

  // Zuerst einmal alle Verbindungen auf unendlich setzen
  for (int i = 0; i < anzahl; ++i) {
    for (int j = 0; j < anzahl; ++j) {
      entf[i][j] = HUGE_VAL;
    }
  }
  
  // Wie viele Verbindungen soll jede Stadt mindestens bekommen
  // Das k�nnen nicht mehr sein, als es andere St�dte gibt!
  int verb_soll = (MIN_VERB < (anzahl - 1)) ? MIN_VERB : (anzahl - 1);
  
  // Verbindungen erzeugen, Stadt f�r Stadt
  for (int i = 0; i < anzahl; ++i) {
    // Erster Schritt:
    // Z�hle die schon vorhandenen Verbindungen,
    // berechne die L�nge der noch nicht vorhandenen in einem Hilfs-Array
    double hilfs[anzahl];
    int verb_anz = 0;
    for (int j = 0; j < anzahl; ++j) {
      if (i == j) {
        // Verbindung zu sich selbst ausschlie�en!
        hilfs[j] = HUGE_VAL;
        continue;
      }
      if (entf[i][j] == HUGE_VAL) {
        double dx = koord[i].x - koord[j].x;
        double dy = koord[i].y - koord[j].y;
        hilfs[j] = sqrt(dx * dx + dy * dy);
      } else {
        ++verb_anz;
        hilfs[j] = HUGE_VAL;
      }
    }
    
    // Zweiter Schritt:
    // F�ge neue Verbindungen hinzu, bis die gew�nschte Anzahl erreicht ist
    for ( ; verb_anz < verb_soll; ++verb_anz) {
      // Suche die k�rzeste Verbindung im Hilfs-Array und deren Stadt k
      double min = HUGE_VAL;
      int k = -1;
      for (int j = 0; j < anzahl; ++j) {
        if (hilfs[j] < min) {
          min = hilfs[j];
          k = j;
        }
      }
      // Trage Verbindung i <--> k in beide Richtungen ein
      entf[i][k] = entf[k][i] = min;
      // ... zeichne sie
      sdlDrawLine(koord[i].x, koord[i].y, koord[k].x, koord[k].y,
                  VERB_R, VERB_G, VERB_B);
      // ... und l�sche sie aus dem Hilfs-Array
      hilfs[k] = HUGE_VAL;
    }
  }

  sdlUpdate();
}

// Zeichne die L�sung und berechne zur Pr�fung ihre L�nge
void zeichne_lsg(void)
{
  double summe = 0;
  int alt, neu;  // Alte und neue Stadt eines Schrittes
  
  alt = 0;       // Ausgangspunkt = Stadt 0
  for (int schritt = 1; schritt < anzahl; ++schritt) {
    // suche die Stadt f�r diesen Schritt in der L�sung
    for (neu = 0; ; ++neu) {
      if (neu >= anzahl) {
        printf("Mir fehlt Schritt Nummer %d!\n", schritt);
        exit(EXIT_FAILURE);
      }
      if (opt_reihenf[neu] == schritt) break;
    }
    // Verbindung von der vorigen Stadt ausgeben und aufsummieren
    sdlDrawLine(koord[alt].x, koord[alt].y, koord[neu].x, koord[neu].y,
                ROUTE_R, ROUTE_G, ROUTE_B);
    summe += entf[alt][neu];
    // die aktuelle Stadt ist im n�chsten Schritt die vorige Stadt
    alt = neu;
  }

  // gib den Weg zur�ck zur ersten Stadt aus, er geh�rt auch zur Gesamtl�nge
  sdlDrawLine(koord[alt].x, koord[alt].y, koord[0].x, koord[0].y,
              ROUTE_R, ROUTE_G, ROUTE_B);
  summe += entf[alt][0];

  sdlUpdate();  

  // stimmt die L�nge �berein?
  if (summe != optimum) {
    printf("Die L�nge stimmt nicht (ist: %g / laut L�sung: %g)!\n",
           summe, optimum);
  } else {
    printf("Gesamtl�nge f�r %d St�dte %g\n", anzahl, summe);
  }
}

int main(int argc, const char *argv[])
{
  if ((argc != 2) ||
      ((anzahl = atoi(argv[1])) < 3) ||
      (anzahl > MAX_ANZ)) {
    fprintf(stderr, "Usage: %s city_count  (= 3...%d)\n", argv[0], MAX_ANZ);
    exit(EXIT_FAILURE);
  }

  srand(time(NULL));
  
  sdlInit();

  // Initialisiere und zeichne die St�dte und Verbindungen
  erzeuge_karte();

  // setze die aktuelle L�sung auf "noch keine Stadt besucht"
  for (int i = 0; i < anzahl; ++i) {
    akt_reihenf[i] = -1;
  }

  // unsere Suche beginnt immer bei Stadt 0, sie ist auch Schritt 0
  suche(0, 0, 0);

  if (optimum == HUGE_VAL) {
    printf("Keine L�sung gefunden!\n");
  } else {
    zeichne_lsg();
  }    

  // periodisches sdlMilliSleep, damit periodisch auf Close-Events gepr�ft wird
  for (;;) {
    sdlMilliSleep(100);
  }
  
  sdlExit();
  
  exit(EXIT_SUCCESS);
}
