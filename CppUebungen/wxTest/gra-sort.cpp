// Verschiedene Sortierverfahren, grafisch dargestellt
//
// Aufruf: gra-sort
//
// Klaus Kusche, 2011

// für Zufallszahlen
#include <cstdlib>
#include <ctime>

using namespace std;

#include <wx/app.h>
#include <wx/frame.h>
#include <wx/dcclient.h>
#include <wx/statusbr.h>
#include <wx/button.h> 
#include <wx/choice.h> 
#include <wx/sizer.h> 
#include <wx/event.h>

// Anzahl der Elemente im zu sortierenden Array
// == Größe des Grafik-Fensters in Pixel
const int arrSize = 500;
//const int arrSize = 200;

// Alle compUpdInterval Vergleiche wird der Vergleichszähler
// in der Statuszeile aktualisiert
const int compUpdInterval = 5;
// dasselbe für den Vertauschungszähler
const int swapUpdInterval = 1;

// Verzögerung für Quicksort in ms (zum besseren Beobachten)
const int qsDelay = 300;

// Auswahlliste für die Initialisierung des Arrays
const wxString initList[] = {
  "Aufsteigend", "Absteigend", "Durcheinander",
  "Fast sortiert", "Sortiert mit Neuen", "Lauter Gleiche"
};
const int initSize = sizeof(initList) / sizeof(initList[0]);
// Auswahlliste für das Sortierverfahren
const wxString sortList[] = {
  "Selection Sort", "Insertion Sort", "Bubblesort",
  "Bi-Bubblesort", "Shellsort", "Heapsort",
  "Quicksort", "Quicksort (verzoegert)",
  "Quicksort (einfaches Part)", "Quicksort (best-of-3 Part)"
};
const int sortSize = sizeof(sortList) / sizeof(sortList[0]);

class MyApp: public wxApp
{
  virtual bool OnInit();
};

// Klasse für das zu sortierende Array
class Array
{
  public:
    // das Array bekommt den wxClientDC des Grafikfensters und die Statuszeile,
    // damit es etwas ausgeben kann
    Array(wxClientDC *graWin, wxStatusBar *stBar);

    // Initialisierungsfunktionen
    // (zeigen das initialisierte Array auch an)
    void ascending();
    void descending();
    void random();
    void nearlysorted();
    void appended();
    void allequal();

    // Sortierfunktionen
    // (aktualisieren auch Grafik und Statuszeile)
    void selSort();
    void insSort();
    void bubbleSort();
    void biBubbleSort();
    void shellSort();
    void heapSort();
    // bei quicksort:
    // ms ist die Verzögerung: Wenn ms größer 0 ist:
    // vor den beiden rekursiven Aufrufen ein wxMilliSleep(ms) machen!
    // simple wählt den einfacheren Partitions-Algorithmus (wenn true)
    // opt wählt die best-of-3-Ermittlung des Partitionswertes
    void quickSort(int ms, bool simple, bool opt);

  private:
    // Vergleiche data[i] und data[j]
    // Ergebnis < 0, == 0 oder > 0, je nachdem, ob data[i] <, == oder > data[j]
    // aktualisiere die Statuszeile
    int Comp(int i, int j);
    // Vertausche data[i] und data[j]
    // aktualisiere die Grafik und die Statuszeile
    void Swap(int i, int j);

    // Zeige das gesamte Array im Grafikfenster an
    void PlotData();
    // Zeichne einen Punkt für data[i] (wenn data[i] > 0)
    // oder lösche ihn weg (wenn data[i] < 0)
    void DrawPoint(int i);
    // Aktualisiere die Vergleichszahl / die Vertauschungszahl
    void UpdateCompCnt(void);
    void UpdateSwapCnt(void);

    // Hilfsfunktion des Heapsort
    void heapify(int left, int right);
    // Rekursive Funktion des Quicksort
    void quick1(int left, int right, int ms, bool simple, bool opt);

    wxClientDC *dc;       // wxClientDC des Grafikfensters (zum Grafik Anzeigen)
    wxStatusBar *status;  // Statusbar des Hauptfensters (zum Text Anzeigen)
    
    int data[arrSize];    // zu sortierendes Array
    int deleted[arrSize]; // markiere in der Grafik zu löschende Punkte
    int compCnt;          // Vergleichszähler
    int swapCnt;          // Vertauschungszähler
};

// Klasse für das Grafik-Subfenster: Abgeleitet vom allgemeinen wxWindow
class Grafik: public wxWindow
{
  public:
    Grafik(wxWindow *parent);

    // für Repaint-Events
    void OnPaint(wxPaintEvent &event);
};

// Klasse für das Hauptfenster
class MyFrame: public wxFrame
{
  public:
    MyFrame();

    void OnRun(wxCommandEvent &event);
    void OnQuit(wxCommandEvent &event);
        
    // das Grafik-Subfenster
    Grafik *grafik;  
  private:
    // die Statuszeile
    wxStatusBar *status;

    // Auswahl-Pulldown der Initialisierungsfunktion und der Sortierfunktion
    wxChoice *initChoice, *sortChoice;
    // Buttons "Starten" und "Beenden"
    wxButton *Quit, *Run;
};

enum {
  ID_Quit = 1,
  ID_Run
};

IMPLEMENT_APP(MyApp)

MyFrame *frame;

bool MyApp::OnInit() {
  srand(time(nullptr));
  frame = new MyFrame();
  frame->Show(true);
  frame->grafik->Show(true);
  SetTopWindow(frame);
  return true;
} 

MyFrame::MyFrame() :
  wxFrame(nullptr, -1, "Sortierverfahren"),
  // neues Board anlegen, bekommt Pointer auf neue Statusbar des Hauptfensters
  grafik(new Grafik(this)),
  status(CreateStatusBar()),
  initChoice(new wxChoice(this, -1, wxDefaultPosition, wxDefaultSize,
                          initSize, initList)),
  sortChoice(new wxChoice(this, -1, wxDefaultPosition, wxDefaultSize,
                          sortSize, sortList)),
  Quit(new wxButton(this, ID_Quit, "E&xit")),
  Run(new wxButton(this, ID_Run, "&Run"))
{
  wxBoxSizer *mainsizer = new wxBoxSizer(wxVERTICAL);
  wxBoxSizer *buttonsizer1 = new wxBoxSizer(wxHORIZONTAL);
  wxBoxSizer *buttonsizer2 = new wxBoxSizer(wxHORIZONTAL);

  buttonsizer1->Add(initChoice, 1, wxALL | wxALIGN_CENTER, 5);    
  buttonsizer1->Add(sortChoice, 1, wxALL | wxALIGN_CENTER, 5);    
  buttonsizer2->Add(Run, 1, wxALL | wxALIGN_CENTER, 5);    
  buttonsizer2->Add(Quit, 1, wxALL | wxALIGN_CENTER, 5);    
  mainsizer->Add(grafik, 1, wxALL | wxALIGN_CENTER_VERTICAL | wxALIGN_CENTER_HORIZONTAL, 5);
  mainsizer->Add(buttonsizer1, 0, wxEXPAND);
  mainsizer->Add(buttonsizer2, 0, wxEXPAND);
  SetSizerAndFit(mainsizer);

  initChoice->SetSelection(0);
  sortChoice->SetSelection(0);
  status->SetFieldsCount(2);

  Bind(wxEVT_COMMAND_BUTTON_CLICKED, &MyFrame::OnQuit, this, ID_Quit);
  Bind(wxEVT_COMMAND_BUTTON_CLICKED, &MyFrame::OnRun, this, ID_Run);  
}

void MyFrame::OnRun(wxCommandEvent &WXUNUSED(event))
{
  wxClientDC dc(grafik);
  Array a(&dc, status);
  
  // da Run länger läuft, drehen wir alle GUI-Elemente ab, solange Run läuft
  initChoice->Disable();
  sortChoice->Disable();
  Quit->Disable();
  Run->Disable();
  
  switch (initChoice->GetSelection()) {
    case 0: a.ascending(); break;
    case 1: a.descending(); break;
    case 2: a.random(); break;
    case 3: a.nearlysorted(); break;
    case 4: a.appended(); break;
    case 5: a.allequal(); break;
    default:
      status->SetStatusText("Internal Error: Invalid Init Function");
      break;
  }
  
  switch (sortChoice->GetSelection()) {
    case 0: a.selSort(); break;
    case 1: a.insSort(); break;
    case 2: a.bubbleSort(); break;
    case 3: a.biBubbleSort(); break;
    case 4: a.shellSort(); break;
    case 5: a.heapSort(); break;
    case 6: a.quickSort(0, false, false); break;
    case 7: a.quickSort(qsDelay, false, false); break;
    case 8: a.quickSort(0, true, false); break;
    case 9: a.quickSort(0, false, true); break;
    default:
      status->SetStatusText("Internal Error: Invalid Sort Function");
      break;
  }
  
  initChoice->Enable();
  sortChoice->Enable();
  Quit->Enable();
  Run->Enable();
}

void MyFrame::OnQuit(wxCommandEvent &WXUNUSED(event))
{
  Close(true);
}

Grafik::Grafik(wxWindow *parent) :
  wxWindow(parent, -1, wxDefaultPosition, wxDefaultSize, wxFULL_REPAINT_ON_RESIZE)
{
  SetMinSize(wxSize(arrSize + 2, arrSize + 2));
  SetMaxSize(wxSize(arrSize + 2, arrSize + 2));

  wxClientDC dc(this);
  dc.SetBackground(*wxWHITE_BRUSH);
  dc.Clear();

  Bind(wxEVT_PAINT, &Grafik::OnPaint, this); 
}

// durch wxEVT_PAINT aufgerufene Repaint-Methode bei Resize usw.
void Grafik::OnPaint(wxPaintEvent &WXUNUSED(event))
{
  wxPaintDC dc(this);  // im Repaint muss es ein wxPaintDC statt wxClientDC sein
  dc.SetBackground(*wxWHITE_BRUSH);
  dc.Clear();          // da wir keinen Zugriff auf das Array haben,
                       // machen wir das Grafik-Fenster einfach ganz leer
}

Array::Array(wxClientDC *graWin, wxStatusBar *stBar) :
  dc(graWin),
  status(stBar),
  compCnt(0),
  swapCnt(0)
{
  dc->SetPen(*wxBLACK_PEN);
  dc->SetBrush(*wxBLACK_BRUSH);
  dc->SetBackground(*wxWHITE_BRUSH);
  dc->Clear();
  UpdateCompCnt();
  UpdateSwapCnt();
  
  for (int i = 0; i < arrSize; ++i) {
    deleted[i] = false;
  }
}

int Array::Comp(int i, int j)
{
  if (++compCnt % compUpdInterval == 0) {
    UpdateCompCnt();
  }

  // Unsere Daten sind zwischen 0 und (arrSize - 1)
  // Beim - tritt daher kein Überlaugf auf.
  return data[i] - data[j];
}

void Array::Swap(int i, int j)
{
  int tmp;

  if (++swapCnt % swapUpdInterval == 0) {
    UpdateSwapCnt();
  }

  deleted[i] = true;
  deleted[j] = true;

  DrawPoint(i);
  DrawPoint(j);

  tmp = data[i];
  data[i] = data[j];
  data[j] = tmp;

  deleted[i] = false;
  deleted[j] = false;

  DrawPoint(i);
  DrawPoint(j);
}

void Array::PlotData()
{
  dc->Clear();
  for (int i = 0; i < arrSize; ++i) {
    DrawPoint(i);
  }
}

void Array::DrawPoint(int i)
{
  // war unsere letzte Zeichenoperation schwarz oder weiß? (ursprünglich schwarz)
  static bool erasing = false;

  if (erasing != deleted[i]) {
    erasing = deleted[i];
    dc->SetPen(erasing ? *wxWHITE_PEN : *wxBLACK_PEN);
    dc->SetBrush(erasing ?  *wxWHITE_BRUSH : *wxBLACK_BRUSH);
  }

  // Koordinaten-Ursprung ist oben, nicht unten ==> y umdrehen!
  // data-Werte sind zwischen 0 und (arrSize - 1)
  dc->DrawRectangle(i, (arrSize - 1) - data[i], 3, 3);

  // wenn ein gelöschter Punkt benachbarte Punkte "beschädigt" hat:
  // benachbarte Punkte neu zeichnen!
  // (außer sie sind auch gelöscht)
  if (deleted[i]) {
    if ((i > 1) && !deleted[i - 2] && (abs(data[i - 2] - data[i]) <= 2)) {
      DrawPoint(i - 2);
    }
    if ((i > 0) && !deleted[i - 1] && (abs(data[i - 1] - data[i]) <= 2)) {
      DrawPoint(i - 1);
    }
    if ((i < arrSize - 1) && !deleted[i + 1] && (abs(data[i + 1] - data[i]) <= 2)) {
      DrawPoint(i + 1);
    }
    if ((i < arrSize - 2) && !deleted[i + 2] && (abs(data[i + 2] - data[i]) <= 2)) {
      DrawPoint(i + 2);
    }
  }
  frame->Refresh();
  frame->Update();
}

void Array::UpdateCompCnt(void)
{
  wxString txt = "Vergleiche: ";
  txt << compCnt;
  status->SetStatusText(txt, 0);
}

void Array::UpdateSwapCnt(void)
{
  wxString txt = "Vertauschungen: ";
  txt << swapCnt;
  status->SetStatusText(txt, 1);
}

void Array::ascending()
{
  for (int i = 0; i < arrSize; ++i) {
    data[i] = i;
  }
  PlotData();
}

void Array::descending()
{
  for (int i = 0; i < arrSize; ++i) {
    data[i] = (arrSize - 1) - i;
  }
  PlotData();
}

void Array::random()
{
  for (int i = 0; i < arrSize; ++i) {
    data[i] = i;
  }
  for (int k = 0; k < arrSize * 10; ++k) {
    int tmp;
    int i = rand() % arrSize;
    int j = rand() % arrSize;
    tmp = data[i];
    data[i] = data[j];
    data[j] = tmp;
  }
  PlotData();
}

void Array::nearlysorted()
{
  for (int i = 0; i < arrSize; ++i) {
    data[i] = i;
  }
  for (int k = 0; k < arrSize / 5; ++k) {
    int tmp;
    int i = rand() % (arrSize - 20);
    int j = i + rand() % 20;
    tmp = data[i];
    data[i] = data[j];
    data[j] = tmp;
  }
  PlotData();
}

void Array::appended()
{
  for (int i = 0; i < arrSize; ++i) {
    data[i] = i;
  }
  for (int k = 0; k < arrSize / 20; ++k) {
    int tmp;
    int i = rand() % (arrSize - 1);
    tmp = data[i];
    for (int j = i + 1; j < arrSize; ++j) {
      data[j - 1] = data[j];
    }
    data[arrSize - 1] = tmp;
  }
  PlotData();
}

void Array::allequal()
{
  for (int i = 0; i < arrSize; ++i) {
    data[i] = arrSize / 2;
  }
  PlotData();
}

void Array::selSort()
{
  for (int i = 0; i < arrSize - 1; ++i) {
    // bringe das kleinste der restlichen Elemente an die Position i
    int minIdx = i;  // minIdx = Index des kleinsten Elementes ab Position i
    for (int j = i + 1; j < arrSize; ++j) {
      if (Comp(minIdx, j) > 0) {
        minIdx = j;
      }
    }
    if (minIdx != i) {
      Swap(i, minIdx);
    }
  }
  UpdateCompCnt();
  UpdateSwapCnt();
}

void Array::insSort()
{
  for (int i = 1; i < arrSize; ++i) {
    // lass das Element i an die richtige Stelle nach vor rutschen:
    // vergleiche und vertausche es mit dem Vorgänger,
    // bis es passt oder bis es ganz links ist
    for (int j = i; (j > 0) && (Comp(j - 1, j) > 0); --j) {
      Swap(j, j - 1);
    }
  }
  UpdateCompCnt();
  UpdateSwapCnt();
}

void Array::bubbleSort()
{
  // bis zu welchem Element muss ich noch vergleichen?
  // beim ersten Lauf: Bis ganz hinten
  // ab dem zweiten Lauf: Bis zur letzten Vertauschung des vorigen Laufes
  int limit;
  // bei welchem Element war die letzte Vertauschung im aktuellen Lauf?
  // (alle dahinter stimmen schon!)
  // Wenn keine Vertauschung mehr war: 0
  int last;
  
  for (limit = arrSize - 1; limit > 0; limit = last) {
    last = 0;
    for (int i = 0; i < limit; ++i) {
      if (Comp(i, i + 1) > 0) {
        Swap(i, i + 1);
        last = i;
      }
    }
  }
  UpdateCompCnt();
  UpdateSwapCnt();
}

void Array::biBubbleSort()
{
  // Idee wie oben, aber mit upper und lower Limit
  int lower, upper, last = 0;
  for (lower = 0, upper = arrSize - 1; lower < upper; ) {
    for (int i = lower; i < upper; ++i) {
      if (Comp(i, i + 1) > 0) {
        Swap(i, i + 1);
        last = i;
      }
    }
    upper = last;
    for (int i = upper; i > lower; --i) {
      if (Comp(i, i - 1) < 0) {
        Swap(i, i - 1);
        last = i;
      }
    }
    lower = last;
  }
  UpdateCompCnt();
  UpdateSwapCnt();
}

void Array::shellSort()
{
  // Eine gute Abstandsfolge aus der Literatur, 0 ist Ende-Markierung
  int dist[] = { 3709, 1195, 385, 124, 40, 13, 4, 1, 0 };
  int s;  // der Abstand zwischen zwei zu vergleichenden Elementen
  for (int k = 0; (s = dist[k]) > 0; ++k) {
    // wie insSort,
    // aber betrachte nur Elemente im Abstand -s -2s, -3s, ...
    // statt das jeweilige Element davor
    for (int i = s; i < arrSize; ++i) {
      for (int j = i; (j >= s) && (Comp(j - s, j) > 0); j -= s) {
        Swap(j, j - s);
      }
    }
  }
  UpdateCompCnt();
  UpdateSwapCnt();
}

// Die übliche Hilfsfunktion für den Heapsort:
// Betrachte a[left]...a[right] als Teil eines Heaps a[0]...a[right]
// a[left+1]...a[right] muss schon ein korrekter Heap sein,
// Die Funktion lässt a[left] an die richtige Stelle im Heap "einsickern"
// Achtung:
// heapify wird mit Array-Indices left und right
// im Bereich 0 ... arrSize - 1 aufgerufen
// Gedanklich (für die Berechnung des Sohn-Index) müssen wir das
// auf den Bereich Index 1 ... arrSize umrechnen (+1)
// und dann wieder zurück (-1)
void Array::heapify(int left, int right)
{
  int father, son;

  father = left;  // das "einzusickernde" Element
  // tausche den Vater mit dem größeren der beiden Söhne
  // bis der Vater größer als beide Söhne ist oder kein Sohn mehr im Heap ist
  for (;;) {
    // a[father]..."Vater", a[2*(father+1)-1] und a[2*(father+1)]..."Söhne"
    son = 2 * (father + 1) - 1;  // linker Sohn
    if (son > right) break;      // kein Sohn mehr im Heap ==> fertig
    // wenn es im Heap auch einen rechten Sohn gibt ...
    if (son + 1 <= right) {
      // ... und dieser größer als der linke Sohn ist ...
      if (Comp(son, son + 1) < 0) {
        // stelle son auf den rechten (größeren) der beiden Söhne
        ++son;
      }
    }
    // vergleiche den größeren Sohn mit dem einzusickernden Vater
    if (Comp(father, son) >= 0) {
      break;           // Vater ist größer, fertig!
    }
    Swap(father, son); // Sohn ist größer, mit dem Vater tauschen
    father = son;      // ... und von der neuen Position weiter einsickern
  }
}

void Array::heapSort()
{  
  // Erster Schritt: Verwandle das unsortierte Array in einen Heap 
  // Von der Mitte nach vor: Jedes Element einzeln einsickern lassen
  // (alles hinter der Mitte ist per Definition schon ein Heap)
  for (int i = (arrSize - 1) / 2; i >= 0; --i) {
    heapify(i, arrSize - 1);
  }

  // Zweiter Schritt:
  // Baue das sortierte Ergebnis elementweise von hinten nach vorne auf:
  // Entnimm größtes verbleibendes Element aus dem Heap (Wurzel des Heap, a[0])
  // und tausche es mit dem nächsten Element am hinteren Ende des Arrays
  // Mach den Heap 1 kürzer und lass das nach vorn getauschte Element einsickern
  // bis der Heap nur mehr 1 Element hat
  for (int i = arrSize - 1; i > 0; --i) {
    Swap(0, i);
    heapify(0, i - 1);
  }
  UpdateCompCnt();
  UpdateSwapCnt();
}

// Die übliche rekursive Hilfsfunktion für den Quicksort:
// Sortiere die Elemente zwischen left und right (jeweils inklusive)
// ms ist die Verzögerung: Wenn ms größer 0 ist:
// vor den beiden rekursiven Aufrufen ein wxMilliSleep(ms) machen!
// simple wählt den einfacheren Partitions-Algorithmus (wenn true)
// opt wählt das Partitions-Element mit "middle of three"-Methode (wenn true)
void Array::quick1(int left, int right, int ms, bool simple, bool opt)
{
  if (left < right) {  // else: Arraylänge <= 1, Rekursionsende: Nichts zu tun!
    if (right - left <= 4) {
      // Optimierung, könnte man auch weglassen
      // bis zu 4 Elementen: Insertion Sort statt Quicksort
      // geht in der Praxis schneller
      for (int i = left + 1; i <= right; ++i) {
        for (int j = i; (j > left) && (Comp(j - 1, j) > 0); --j) {
          Swap(j, j - 1);
        }
      }
    } else {
      int i, j;
      if (opt) {
        // "best of 3"-Optimierung, um ein gutes Pivot-Element zu finden:
        // Wir nehmen das wertmäßig mittlere
        // von erstem, mittlerem und letztem Element
        // und bringen es ganz nach rechts "in Sicherheit"
        // Abfrage- und Tausch-Reihenfolge aus der Literatur
        int m = (left + right) / 2;
        if (Comp(left, m) > 0) {
          Swap(left, m);
        }
        if (Comp(left, right) > 0) {
          Swap(left, right);
        }
        if (Comp(m, right) < 0) {
          Swap(m, right);
        }
      } else {
        // wir nehmen das Element in der Mitte zwischen left und right
        // als Pivot-Element, bringen es ganz nach rechts "in Sicherheit"
        Swap((left + right) / 2, right);
      }
      // ... und partitionieren die Elemente davor (bis right - 1)
      if (simple) {
        // Variante ähnlich englischer Wikipedia, Stand 1. Okt. 2013
        // ist einfacher, aber macht viel mehr Vertauschungen!
        // (weil zu große Elemente ev. mehrmals nach rechts geschoben werden)
        i = left;  // Index des ersten Elementes des "großen" Teils im Array
                   // = Index, an dem das nächste Element < Pivot gespeichert wird
        for (j = i; j <= right - 1; ++j) { // geh alle Elemente durch
          // alle Elemente links von i sind < Pivot
          // alle Elemente von i bis vor j sind >= Pivot
          // alle Elemente ab j sind noch unbekannt
          if (Comp(j, right) < 0) { // Element j ist kleiner als Pivot
            Swap (i, j);            // ==> bring es nach vor
            ++i;                    // und mach "kleinen" Teil eins größer
          }
        }
      } else {
        // Variante ähnlich deutscher Wikipedia, Stand 1. Okt. 2013
        // besser!
        i = left;       // wandert von links nach rechts
                        // alle Elemente links von i sind schon <= Pivot
        j = right - 1;  // beginnt vor dem Element ganz rechts (Pivot),
                        // wandert von rechts nach links
                        // alle Elemente rechts von j sind schon >= Pivot
                        // alle Elemente zwischen i und j sind noch unbekannt

        for (;;) {
          // suche von links ein zu großes Element
          while ((i < right) && (Comp(i, right) <= 0)) {
            ++i;
          }
          // suche von rechts ein zu kleines Element
          while ((j > i) && (Comp(j, right) >= 0)) {
            --j;
          }
          if (i >= j) break; // i und j sind zusammengestoßen ==> fertig!
          // i ist links von j:
          // i zeigt links auf ein zu großes Element,
          // j zeigt weiter rechts auf ein zu kleines Element
          Swap(i, j);
          // Nach dem Tausch: Element i und j sind richtig
          // ==> Eins weitergehen und dann erneut falsche Elemente suchen
          ++i; --j;
        }
      }

      // i ist jetzt der Index, an dem die Teile geteilt werden
      // (der Index des ersten Elementes >= Pivot im Array)
      // dort gehört unser Pivot hin (außer i zeigt schon auf's Pivot)
      if (i < right) {
        Swap(i, right);
      }
      
      // an dieser Stelle zeigt i auf das Pivot-Element
      // alle Elemente davor sind <= dem Element i, alle dahinter >=
      // Element i selbst ist schon fertig, bleibt unverändert
      // Sortiere die Elemente left...(i-1) und (i+1)...right rekursiv
      if (ms > 0) wxMilliSleep(ms);
      quick1(left, i - 1, ms, simple, opt);
      quick1(i + 1, right, ms, simple, opt);
    }
  }
}

void Array::quickSort(int ms, bool simple, bool opt)
{
  quick1(0, arrSize - 1, ms, simple, opt);
  UpdateCompCnt();
  UpdateSwapCnt();
}
