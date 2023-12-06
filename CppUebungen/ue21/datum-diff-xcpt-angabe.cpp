// Differenz zweier Datumseingaben in Tagen
// Mit Terminal-Eingabe
// Programm ohne Exceptions zum Umbauen auf Exceptions
//
// Aufruf: datum-diff-xcpt-angabe
// 
// Klaus Kusche, 2012

#include <iostream>
#include <cstdlib>
#include <climits>
#include <string>
#include <cstring>

using namespace std;

//include selv made calss:
#include <exception>
#include <sstream>
class DatumEx : public exception{
  public:
    DatumEx(const char *err, int errNumInit) : exception(), errStr(err), errNum(errNumInit){ }
  
    ~DatumEx() { free(ret); }

    virtual const char *what() noexcept  {
      std::stringstream st;
      st << errStr << ':' << errNum << endl << "Korektes eingabe format: ddmmyyyy.";
      return ret = strdup(st.str().c_str());
    }
  private:
    const char *errStr;
    const int errNum;
    char *ret;
};

void EingabeFehler(const char *meldung, int wert);
bool IstSchaltjahr(int jahr);
int TageImJahr(int jahr);
int TageImMonat(int monat, int jahr);
int JahrAusDatum(int datum);
int MonatAusDatum(int datum);
int TagAusDatum(int datum);
int TageBisDatum(int datum);
int liesDatum(const char *prompt);

// Ist "jahr" ein Schaltjahr? (Returnwert true oder false)
bool IstSchaltjahr(int jahr)
{
  // Gibt das Ergebnis der Bedingung als Returnwert zurück
  return (jahr % 400 == 0) || ((jahr % 4 == 0) && (jahr % 100 != 0));
}

// Wie viele Tage hat das Jahr "jahr"?
int TageImJahr(int jahr)
{
  return IstSchaltjahr(jahr) ? 366 : 365;
}

// Liefert die Anzahl der Tage des Monats "monat" im Jahr "jahr"
int TageImMonat(int monat, int jahr)
{
  static const int monatTage[12] =
    { 31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    
  if (monat == 2) {
    return IstSchaltjahr(jahr) ? 29 : 28;
  } else {
    return monatTage[monat - 1];
  }
}

// Liefert das "yyyy" aus "ddmmyyyy"
int JahrAusDatum(int datum)
{
  int jahr = datum % 10000;
  if (jahr < 1) {
    throw DatumEx("Wronge Year Input",datum);
  }
  
  return jahr;
}

// Liefert das "mm" aus "ddmmyyyy"
int MonatAusDatum(int datum)
{
  int monat = (datum / 10000) % 100;
  if ((monat < 1) || (monat > 12)) {
    throw DatumEx("Wrong Month input",datum);
  }

  return monat;
}

// Liefert das "dd" aus "ddmmyyyy"
int TagAusDatum(int datum)
{
  int tag = datum / 1000000;
  int maxTag = TageImMonat(MonatAusDatum(datum), JahrAusDatum(datum));
  if ((tag < 1) || (tag > maxTag)) {
    throw DatumEx("Wrong Day input",datum);
  }
  
  return tag;
}

// Verwandelt "ddmmyyyy"-Zahl in "Tage seit 1.1.01": Liefert Anzahl der Tage.
int TageBisDatum(int datum)
{
  if (datum <= 0) {
    throw DatumEx("Basic error",datum);
  }

  int tag = TagAusDatum(datum);
  int monat = MonatAusDatum(datum);
  int jahr = JahrAusDatum(datum);

  // summiere:
  // * alle ganzen Jahre vor dem Datum
  // * alle ganzen Monate vor dem Datum
  // * die Tage im aktuellen Monat
  int tage = 0;
  for (int i = 1; i < jahr; ++i) {
    tage += TageImJahr(i);
  }
  for (int i = 1; i < monat; ++i) {
    tage += TageImMonat(i, jahr); 
  }
  tage += tag;

  return tage;
}

int liesDatum(const char *prompt)
{
  int eingabe;
  cout << prompt;
  cin >> eingabe;

  return TageBisDatum(eingabe);
}

int main(void)
{
  int von,bis;
  FIRST_DATUM:
  try{
    von = liesDatum("Anfangsdatum? ");
  }
  catch (DatumEx &err){
    cerr << err.what() << endl; 
    if(cin.eof()) exit(EXIT_FAILURE);
    cin.clear();
    cin.ignore(INT_MAX,'\n');
    goto FIRST_DATUM;
  }
  SECOND_DATUM:
  try{
    bis = liesDatum("Enddatum? ");
  }
  catch (DatumEx &err){
    cerr << err.what() << endl; 
    if(cin.eof()) exit(EXIT_FAILURE);
    cin.clear();
    cin.ignore(INT_MAX,'\n');
    goto SECOND_DATUM;
  }
  cout << "Zeitabstand " << bis - von << " Tage." << endl;

  exit(EXIT_SUCCESS);
}
