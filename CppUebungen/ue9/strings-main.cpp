// String-Klasse, Hauptprogramm zum Testen
//
// Aufruf: strings
//
// Klaus Kusche, 2012

#include "stringS.h"

#include <iostream>
// hier fehlt noch ein Header

using namespace std;

// hier fehlt die Klasse "String" und der Ausgabe-Operator daf�r

int main()
{
  String nix;
  String a = "�pfel";
  String aa = a;
  String b = "Birnen";
  String bb;
  String k = "Kompott";
  String ab = "�pfelBirnen";
  String res;

  bb = b;
  res = aa + String("") + bb;

  cout << "Ist 'nix' leer? " << (!nix ? "Ja!" : "Nein???") << endl;
  cout << "'" << bb << "' sind " << (!bb ? "auch" : "nicht") << " leer." << endl;
  cout << "'" << a << "' und '" << b << "' sind " <<
      ((a == b) ? "gleich" : "verschieden") << "." << endl;
  cout << "'" << bb << "' sind " << (bb < k ? "kleiner" : "gr��er") <<
      " als '" << k << "'" << endl;
  cout << "'" << k << "' ist " << (k < b ? "kleiner" : "gr��er") <<
      " als '" << b << "'" << endl;
  cout << "'" << aa << "' plus '" << bb << "' sind '" << res << "'." << endl;
  cout << "Sind es wirklich '�pfelBirnen'? " <<
      ((ab == res) ? "Ja!" : "Nein???") << endl;

  // ab hier auskommentieren, solange du noch kein += hast
  a += bb;
  a += k;
  cout << "Und jetzt gibt es '" << a << "'." << endl;


  return 0;
}
