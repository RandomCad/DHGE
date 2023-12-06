// Rahmenprogramm zum grafischen Sortieren, mit Pointern statt Index
//
// Aufruf: sort-ptr anzahl
//
// Klaus Kusche, 2021

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

#include "sdlinterf.h"

// Verz�gerungen (in Millisekunden) f�r die Grafik-Anzeige
// ... beim Start
#define START_MS 200
// ... am Ende (bevor das Fenster verschwindet)
#define ENDE_MS 3000
// ... bei jedem Vergleich
#define VERGL_MS  500 //basis 50
// ... bei jeder Vertauschung
#define TAUSCH_MS 1000

// die Farbwwerte
const int farbe_normal[] = { 0, 255, 0 };     // normaler Balken
const int farbe_vergl[] = { 255, 255, 0 };    // zu vergleichender Balken
const int farbe_tausch[] = { 255, 0, 255 };   // zu vertauschender Balken
const int farbe_schwarz[] = { 0, 0, 0 };      // schwarz (zum Wegl�schen)

// Konstanten (in Pixeln) f�r das Grafik-Layout
// initialisiert in "main", benutzt in "balken"
// Breite eines Balkens
int breite;
// Eine H�hen-Einheit
int hoehe;
// Linker Rand = Startposition des ersten Balkens in X-Richtung
// (gleicher Rand links & rechts,
// damit die Balken im Fenster sch�n in der Mitte stehen)
int xstart;

// Z�hler f�r die Vergleiche und Vertauschungen
int vergl = 0;
int vertau = 0;

// Pointer auf den Anfang unseres Arrays
// F�r die Funktion "balken", damit sie ausrechnen kann,
// das wievielte Element im Array sie zeichnen soll
int *arr_beg;

// Zeichne den Balken f�r das Array-Element, auf das p zeigt, in Farbe farbe
void balken(const int *p, const int farbe[])
{
  int xpos = xstart + (p - arr_beg) * breite;
  sdlDrawRectFromTo(xpos + 1, SDL_Y_SIZE - 1,
                    xpos + breite - 1, SDL_Y_SIZE - *p * hoehe,
                    farbe[0], farbe[1], farbe[2]);
  sdlUpdate();
}

// Vergleiche mit farbiger Anzeige und Verz�gerung:
// Ist das Element, auf das p1 zeigt, kleiner als das Element, auf das p2 zeigt?
// Ergebnis: true / false
// Da wir das Array mit lauter verschiedenen Elementen initialisieren,
// kommt "gleich" nicht vor!
bool kleiner(const int *p1, const int *p2)
{
  ++vergl;

  balken(p1, farbe_vergl);
  balken(p2, farbe_vergl);
  sdlMilliSleep(VERGL_MS);
  balken(p1, farbe_normal);
  balken(p2, farbe_normal);
  
  return (*p1 < *p2);
}

// Vertausche das Element, auf das p1 zeigt, mit dem Element, auf das p2 zeigt
// mit farbiger Anzeige und Verz�gerung
void tausche(int *p1, int *p2)
{
  ++vertau;

  // zeichne die zu vertauschenden Balken f�rbig
  balken(p1, farbe_tausch);
  balken(p2, farbe_tausch);
  sdlMilliSleep(TAUSCH_MS);

  // zeichne den l�ngeren alten Balken schwarz,
  // weil sonst w�rde nach dem Tausch beim �berzeichnen mit dem k�rzeren Balken
  // oben ein Rest sichtbar bleiben!
  if (*p1 > *p2) {
    balken(p1, farbe_schwarz);
  } else {
    balken(p2, farbe_schwarz);
  }

  // tausche
  int tmp = *p1;
  *p1 = *p2;
  *p2 = tmp;

  // zeichne die vertauschten Balken normal
  balken(p1, farbe_normal);
  balken(p2, farbe_normal);
}

// Bef�lle das Array zuf�llig mit den Zahlen 1 bis anzahl
// und zeige den Anfangszustand an
void fuelle(int arr[], int anzahl)
{
  for(int *i=arr;i-arr<anzahl;i++) *i=i-arr+1;
  srand(time(NULL));
  for(int i=0;i<3000;i++){
    int rand1=rand()%anzahl, rand2=rand()%anzahl;
    int zwi=arr[rand1];
    arr[rand1]=arr[rand2];
    arr[rand2]=zwi;
  }
  for(int *i=arr;i-arr<anzahl;i++)  balken(i,farbe_normal);
}

int totalAnzahl;

void recursivSelection(int *arr, int anzahl){
  if(anzahl<2||arr==arr_beg+totalAnzahl){
    return;
  }
  if(anzahl==2 && kleiner(arr+1,arr)){
    tausche(arr+1,arr);
    return;
  }
  recursivSelection(arr,anzahl/2);
  recursivSelection(arr+anzahl/2,anzahl/2);
  printf("returnd form recursif%d\n", anzahl);
  for(int *i=arr;i-arr<anzahl;i++){
    for(int *j=arr+anzahl;j-arr>anzahl/2;j--){
      if(kleiner(j,i)){
        tausche(j,i);
        for(int *a=i+1;a-arr<anzahl/2;a++){
          if(kleiner(a,j))  tausche(a,j);
        }
        break;
      }
    }
  }
}

// sortiere das Array
// unter Verwendung von "kleiner" und "tausche"
void sort(int arr[], int anzahl)
{
  recursivSelection(arr,anzahl);
  return;
  for(int *i=arr;i-arr<anzahl-1;i++){

  }
  for(int *i=arr;i<&(arr[anzahl-1]);i++){
    for(int *j=arr+anzahl-1;j>i;j--){
      if(kleiner(j,i)) tausche(j,i);
      if(*i==i[-1]+1) break;
    }
  }
}

int main(int argc, const char *argv[])
{
  if (argc != 2) {
    printf("Aufruf: %s anzahl\n", argv[0]);
    exit(EXIT_FAILURE);
  }
  int anzahl = atoi(argv[1]);
  totalAnzahl=anzahl;
  if ((anzahl <= 0) || (anzahl > SDL_X_SIZE / 2) || (anzahl > SDL_Y_SIZE)) {
    printf("%s: Die Anzahl muss gr��er 0 sein "
          "und in das Grafikfenster passen\n", argv[0]);
    exit(EXIT_FAILURE);
  }
  // Geometrie aus der Anzahl berechnen
  breite = SDL_X_SIZE / anzahl;
  hoehe = SDL_Y_SIZE / anzahl;
  xstart = (SDL_X_SIZE % anzahl) / 2;

  int array[anzahl];
  arr_beg = array;

  srand(time(NULL));

  sdlInit();
  sdlSetBlack();

  fuelle(array, anzahl);
  
  sdlMilliSleep(START_MS);  

  sort(array, anzahl);

  printf("%d Vergleiche\n%d Vertauschungen\n", vergl, vertau);

  sdlMilliSleep(ENDE_MS);
  sdlExit();
  
  exit(EXIT_SUCCESS);
}
