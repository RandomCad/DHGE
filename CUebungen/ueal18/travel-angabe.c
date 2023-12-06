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

// Größe des "Landes" in x- und y-Richtung, in Pixeln
// Rundherum lassen wir 10 Pixel Rand
#define RAND 10
#define BREITE (SDL_X_SIZE - 2 * RAND)
#define HOEHE (SDL_Y_SIZE - 2 * RAND)

// für die Grafik-Ausgabe: Farb-Komponenten für Städte und die Linien
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

// Maximale Anzahl der Städte
// (angelegte Größe der Arrays)
#define MAX_ANZ 100

// Mindest-Anzahl der Verbindungen pro Stadt
// Regelt, wie "dicht" der Graph wird
// Sehr hohe Zahl, z.B. 100 ==> Full Graph (alle möglichen Verbindungen)
// Sehr kleine Zahl, z.B. 3 ==> Oft keine Rundreise möglich
#define MIN_VERB 5

// Tatsächliche Anzahl der Städte
// (tatsächlich benutzte Elemente in den Arrays)
int anzahl;

// Koordinaten der i-ten Stadt
koord_t koord[MAX_ANZ];

// Entfernungs-Matrix: Entfernung von i-ter zu j-ter Stadt
// HUGE_VAL (aus math.h) = "unendlich" = keine Verbindung
// Die Matrix ist symmetrisch:
// Es gilt für alle Elemente entf[von][nach] == entf[nach][von]
double entf[MAX_ANZ][MAX_ANZ];

// Reihenfolge der Städte in der Route:
// Index i der Elemente = Nummer der Stadt
// Wert der Elemente = Nummer des Schrittes, in dem diese Stadt besucht wurde:
// Mit dem wievielten Schritt wurde diese Stadt erreicht?
// Wert -1 steht für "Stadt ist noch nicht besucht"
// 
// ... bei der aktuellen Route?
int akt_reihenf[MAX_ANZ];
// ... bei der bisher optimalen Route?
int opt_reihenf[MAX_ANZ];

// Länge der bisher besten Route
// Solange HUGE_VAL: Bisher keine Route gefunden, opt_reihenf noch undefiniert
double optimum = HUGE_VAL;

void suche(int schritt, int stadt, double summe);
void erzeuge_karte(void);
void zeichne_lsg(void);

// Die rekursive Lösungsfunktion:
// Du stehst nach Schritt Nummer "schritt" in der Stadt Nummer "stadt"
// Deine bisherige Fahrtstrecke ist "summe" lang
// Probiere alle Möglichkeiten für den nächsten Schritt
// (= die nächste Stadt ausgehend von Stadt Nummer "stadt")
void suche(int schritt, int stadt, double summe)
{
  // Schreiben!!!
}

// Befülle die Stadt- und Verbindungs-Arrays
// Zeichne die Städte und Verbindungen
void erzeuge_karte(void)
{
  // Städte erzeugen
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
  // Das können nicht mehr sein, als es andere Städte gibt!
  int verb_soll = (MIN_VERB < (anzahl - 1)) ? MIN_VERB : (anzahl - 1);
  
  // Verbindungen erzeugen, Stadt für Stadt
  for (int i = 0; i < anzahl; ++i) {
    // Erster Schritt:
    // Zähle die schon vorhandenen Verbindungen,
    // berechne die Länge der noch nicht vorhandenen in einem Hilfs-Array
    double hilfs[anzahl];
    int verb_anz = 0;
    for (int j = 0; j < anzahl; ++j) {
      if (i == j) {
        // Verbindung zu sich selbst ausschließen!
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
    // Füge neue Verbindungen hinzu, bis die gewünschte Anzahl erreicht ist
    for ( ; verb_anz < verb_soll; ++verb_anz) {
      // Suche die kürzeste Verbindung im Hilfs-Array und deren Stadt k
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
      // ... und lösche sie aus dem Hilfs-Array
      hilfs[k] = HUGE_VAL;
    }
  }

  sdlUpdate();
}

// Zeichne die Lösung und berechne zur Prüfung ihre Länge
void zeichne_lsg(void)
{
  double summe = 0;
  int alt, neu;  // Alte und neue Stadt eines Schrittes
  
  alt = 0;       // Ausgangspunkt = Stadt 0
  for (int schritt = 1; schritt < anzahl; ++schritt) {
    // suche die Stadt für diesen Schritt in der Lösung
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
    // die aktuelle Stadt ist im nächsten Schritt die vorige Stadt
    alt = neu;
  }

  // gib den Weg zurück zur ersten Stadt aus, er gehört auch zur Gesamtlänge
  sdlDrawLine(koord[alt].x, koord[alt].y, koord[0].x, koord[0].y,
              ROUTE_R, ROUTE_G, ROUTE_B);
  summe += entf[alt][0];

  sdlUpdate();  

  // stimmt die Länge überein?
  if (summe != optimum) {
    printf("Die Länge stimmt nicht (ist: %g / laut Lösung: %g)!\n",
           summe, optimum);
  } else {
    printf("Gesamtlänge für %d Städte %g\n", anzahl, summe);
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

  // Initialisiere und zeichne die Städte und Verbindungen
  erzeuge_karte();

  // setze die aktuelle Lösung auf "noch keine Stadt besucht"
  for (int i = 0; i < anzahl; ++i) {
    akt_reihenf[i] = -1;
  }

  // unsere Suche beginnt immer bei Stadt 0, sie ist auch Schritt 0
  suche(0, 0, 0);

  if (optimum == HUGE_VAL) {
    printf("Keine Lösung gefunden!\n");
  } else {
    zeichne_lsg();
  }    

  // periodisches sdlMilliSleep, damit periodisch auf Close-Events geprüft wird
  for (;;) {
    sdlMilliSleep(100);
  }
  
  sdlExit();
  
  exit(EXIT_SUCCESS);
}
