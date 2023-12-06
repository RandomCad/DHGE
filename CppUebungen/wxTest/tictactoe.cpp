// Tic Tac Toe
//
// Aufruf: tictactoe
//
// Klaus Kusche

#include <wx/app.h>
#include <wx/frame.h>
#include <wx/dcclient.h>
#include <wx/msgdlg.h>
#include <wx/statusbr.h>
#include <wx/button.h> 
#include <wx/sizer.h> 
#include <wx/event.h>

// Anzahl der Steine in einer Reihe mit denen man gewinnt
const int win = 5;
// Größe des Spielfeldes (Seitenlänge in Feldern)
const int size = 21;

class MyApp: public wxApp
{
  virtual bool OnInit();
};

// Klasse für das Spielfeld-Subfenster: Abgeleitet vom allgemeinen wxWindow
class MyBoard: public wxWindow
{
  public:
    // das Spielfeld braucht die Statusbar des Haupt-Frames
    MyBoard(wxWindow *parent, wxStatusBar *stBar);

    void OnPaint(wxPaintEvent &event);  // automatisches Repaint
    void OnClick(wxMouseEvent &event);  // Klick für einen Spielzug
    void Reset();                       // neues Spiel

  private:
    int board[size][size]; // -1 ... frei, 0 ... Kreuzerl, 1 ... Ringerl
    int player;            // Wer ist gerade dran: 0 ... Kreuzerl, 1 ... Ringerl
    int free;              // Anzahl der noch belegbaren Felder, 0 = Spielende
    wxStatusBar *status;   // Statusbar des Hauptfensters (zum Text Anzeigen)

    void Draw(wxDC &dc);   // alles neu zeichnen
    bool Winner(int x, int y); // hat der aktuelle Spieler mit Zug x/y gewonnen?
};

// Hauptfenster
class MyFrame: public wxFrame
{
  public:
    MyFrame();

    // Button-Eventhandler
    void OnReset(wxCommandEvent &event);
    void OnQuit(wxCommandEvent &event);
        
  private:
    MyBoard *board;  // das Spielfeld-Subfenster
};

enum {
  ID_Quit = 1,
  ID_Reset
};

IMPLEMENT_APP(MyApp)

bool MyApp::OnInit()
{
  MyFrame *frame = new MyFrame();
  frame->Show(true);
  SetTopWindow(frame);
  return true;
} 

MyBoard::MyBoard(wxWindow *parent, wxStatusBar *stBar)
: wxWindow(parent, -1, wxDefaultPosition, wxDefaultSize,
    wxFULL_REPAINT_ON_RESIZE),  // Vaterklassen-Konstruktor
  status(stBar)   // merk dir die Statusbar des Hauptfensters
{
  if (size < 10) {
    SetMinSize(wxSize(300, 300));
  } else {
    SetMinSize(wxSize(30 * size, 30 * size));
  }
  
  Reset();  // initialisiert alle Member-Variablen und zeichnet das Spielfeld

  Bind(wxEVT_PAINT, &MyBoard::OnPaint, this);
  Bind(wxEVT_LEFT_UP, &MyBoard::OnClick, this);
}

// durch wxEVT_PAINT aufgerufene Repaint-Methode bei Resize usw.
void MyBoard::OnPaint(wxPaintEvent &WXUNUSED(event))
{
  wxPaintDC dc(this); // im Repaint muss es ein wxPaintDC statt wxClientDC sein
  Draw(dc);
}

const wxString zieh[2] = {
  "Spieler \"Kreuzerl\" ist dran!",
  "Spieler \"Ringerl\" ist dran!"
};

const wxString sieg[2] = {
  "Spieler \"Kreuzerl\" hat gewonnen!",
  "Spieler \"Ringerl\" hat gewonnen!"
};

// Mausklick-Handler
void MyBoard::OnClick(wxMouseEvent &event)
{
  // sonst gibt das Spielfeld-Fenster die Maus nicht mehr her
  // ==> alles wäre blockiert!
  if (HasCapture()) ReleaseMouse();

  if (free == 0) return;  // Spiel schon aus ==> Klicks ignorieren

  // Klick-Position auf Spielfeld-Position umrechnen
  int x, y, w, h;
  event.GetPosition(&x, &y); // frag den Mausklick nach seinen Koordinaten
  GetClientSize(&w, &h);     // das ist die eigene Fenster-Größe ohne Rand usw.
  // das (w % size) / 2 sind die Rundungs-Ausgleichs-Pixel am Rand
  // das (w / size) ist die Breite eines Feldes
  x = (x - (w % size) / 2) / (w / size);
  y = (y - (h % size) / 2) / (h / size);
  if ((x < 0) || (x >= size) || (y < 0) || (y >= size)) {
    // gemein: Klick ist außerhalb des Fensters
    // Passiert, wenn die Maus im Fenster gedrückt und
    // mit gedrückter Taste aus dem Fenster rausgezogen wird!
    return;
  }

  if (board[x][y] != -1) {  // ist das angeklickte Feld frei?
    wxMessageBox("Das Feld ist schon belegt!", "TicTacToe",
                 wxOK|wxICON_INFORMATION, GetParent());
    return;
  }
  // alles passt, setze einen Stein des aktuellen Spielers
  board[x][y] = player;
  --free;

  // alles neu zeichnen (ist Verschwendung, aber das ist uns egal)
  wxClientDC dc(this);
  Draw(dc);

  if (Winner(x, y)) {
    // aktueller Spieler hat gewonnen
    status->SetStatusText(sieg[player]);
    wxMessageBox(sieg[player], "TicTacToe",
                 wxOK|wxICON_INFORMATION, GetParent());
    free = 0;  // beendet das Spiel, verhindert weitere Züge
  } else if (free == 0) {
    // alle Felder belegt und kein Sieger
    status->SetStatusText("Unentschieden.");
    wxMessageBox("Unentschieden.", "TicTacToe",
                 wxOK|wxICON_INFORMATION, GetParent());
  } else {
    // weiter mit nächstem Zug
    player ^= 1;  // Spieler umschalten: XOR wechselt zwischen 0 und 1
    status->SetStatusText(zieh[player]);
  }
}

// Brett auf leer setzen und zeichnen
void MyBoard::Reset()
{
  for (int i = 0; i < size; ++i) {
    for (int j = 0; j < size; ++j) {
      board[i][j] = -1;
    }
  }
  player = 0;
  free = size * size;

  if (IsShownOnScreen()) {  // nur wenn sichtbar, sonst Fehler!
    wxClientDC dc(this);
    Draw(dc);
  }
  status->SetStatusText(zieh[player]);  // erster Spieler darf ziehen
}

// gesamte Grafik neu zeichnen
void MyBoard::Draw(wxDC &dc)
{
  // mit "static" werden die Farbstifte einmal bei Programmstart initialisiert
  // statt bei jedem Aufruf neu
  static wxPen *blackPen = wxThePenList->FindOrCreatePen(*wxBLACK, 3);
  static wxPen *greenPen = wxThePenList->FindOrCreatePen(*wxGREEN, 5);
  static wxPen *redPen = wxThePenList->FindOrCreatePen(*wxRED, 5);

  int w, h;       // Gesamtbreite und -höhe
  int fw, fh;     // Breite und Höhe eines Feldes
  int rw, rh;     // Rand (links & rechts) zum Ausgleich der Rundungsfehler
  dc.GetSize(&w, &h);
  fw = w / size; rw = (w % size) / 2;
  fh = h / size; rh = (h % size) / 2;

  // alles Bisherige weglöschen
  dc.SetBackground(*wxWHITE_BRUSH);
  dc.Clear();        

  dc.SetPen(*blackPen);
  for (int i = 1; i < size; ++i) {
    dc.DrawLine(0, rh + i * fh, w, rh + i * fh);  // waagrecht
    dc.DrawLine(rw + i * fw, 0, rw + i * fw, h);  // senkrecht
  }

  for (int i = 0; i < size; ++i) {
    for (int j = 0; j < size; ++j) {
      if (board[i][j] == 0) {
        // Kreuzerl, rundherum 5 Pixel kleiner als das Feld
        dc.SetPen(*redPen);
        dc.DrawLine(rw + i * fw + 5, rh + j * fh + 5,
                    rw + (i + 1) * fw - 5, rh + (j + 1) * fh - 5);
        dc.DrawLine(rw + (i + 1) * fw - 5, rh + j * fh + 5,
                    rw + i * fw + 5, rh + (j + 1) * fh - 5);
      } else if (board[i][j] == 1) {
        // Ringerl, rundherum 5 Pixel kleiner als das Feld
        dc.SetPen(*greenPen);
        dc.DrawEllipse(rw + i * fw + 5, rh + j * fh + 5, fw - 10, fh - 10);
      }
    }
  }
}

// true wenn der aktuelle Spieler irgendwo "win" Steine in einer Reihe hat.
// Es kann immer nur der Spieler "player" gewinnen, der gerade gezogen hat,
// nicht der andere (bei dem hat sich ja nichts geändert).
// Und die "win" Steine müssen den aktuell gesetzten Stein an Pos x/y enthalten
// (denn bei den anderen Steinen des Spielers hat sich ja nichts geändert).
//
// Der Code ist ein Mittelweg aus "einfach" und "schnell":
// Wir prüfen nicht das gesamte Spielfeld,
// aber auch nicht nur die unmittelbaren an x/y anschließenden Felder,
// sondern die ganze Zeile, die ganze Spalte, und die beiden Diagonalen
// durch den Stein x/y
bool MyBoard::Winner(int x, int y)
{
  int diag, anfang, ende, cnt;

  // für die Zeile: cnt zählt die aufeinanderfolgenden Felder von Player
  cnt = 0;
  for (int i = 0; i < size; ++i) {
    if (board[i][y] == player) {
      ++cnt;
      if (cnt == win) return true;
    } else {
      // leeres oder gegnerisches Feld: Wieder bei 0 anfangen...
      cnt = 0;
    }
  }

  // dasselbe für die Spalte
  cnt = 0;
  for (int i = 0; i < size; ++i) {
    if (board[x][i] == player) {
      ++cnt;
      if (cnt == win) return true;
    } else {
      cnt = 0;
    }
  }

  // eine Diagonale
  diag = x - y;
  if (diag < 0) {
    anfang = 0;
    ende = size + diag;
  } else {
    anfang = diag;
    ende = size;
  }
  cnt = 0;
  for (int i = anfang; i < ende; ++i) {
    if (board[i][i - diag] == player) {
      ++cnt;
      if (cnt == win) return true;
    } else {
      cnt = 0;
    }
  }

  // ... und die andere Diagonale
  diag = (x + y) - (size - 1);
  if (diag < 0) {
    anfang = 0;
    ende = size + diag;
  } else {
    anfang = diag;
    ende = size;
  }
  cnt = 0;
  for (int i = anfang; i < ende; ++i) {
    if (board[i][(size - 1) - (i - diag)] == player) {
      ++cnt;
      if (cnt == win) return true;
    } else {
      cnt = 0;
    }
  }
  
  return false;
}

MyFrame::MyFrame()
: wxFrame(nullptr, -1, "Dodelschach"),
  // neues Board anlegen, bekommt Pointer auf neue Statusbar des Hauptfensters
  board(new MyBoard(this, CreateStatusBar()))
{
  wxButton *Reset = new wxButton(this, ID_Reset, "&Reset");
  wxButton *Quit = new wxButton(this, ID_Quit, "E&xit");
  wxBoxSizer *mainsizer = new wxBoxSizer(wxVERTICAL);
  wxBoxSizer *buttonsizer = new wxBoxSizer(wxHORIZONTAL);

  buttonsizer->Add(Reset, 1, wxALL | wxALIGN_CENTER, 5);    
  buttonsizer->Add(Quit, 1, wxALL | wxALIGN_CENTER, 5);    
  mainsizer->Add(board, 1, wxALL | wxEXPAND, 5);
  mainsizer->Add(buttonsizer, 0, wxEXPAND);
  SetSizerAndFit(mainsizer);

  Bind(wxEVT_COMMAND_BUTTON_CLICKED, &MyFrame::OnQuit, this, ID_Quit);
  Bind(wxEVT_COMMAND_BUTTON_CLICKED, &MyFrame::OnReset, this, ID_Reset);
}

void MyFrame::OnReset(wxCommandEvent &WXUNUSED(event))
{
  board->Reset();
}

void MyFrame::OnQuit(wxCommandEvent &WXUNUSED(event))
{
  Close(true);
}
