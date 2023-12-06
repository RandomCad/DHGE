
// hello.cpp
// Unser erstes GUI-Programm
// Direkt aus dem WxWidgets-Tutorial

// Das inkludiert die wichtigsten wx-Header,
// man k�nnte sie auch einzeln inkludieren...
#include <wx/wx.h>

// Unsere Applikation ist eine WxWidgets-Applikation
// Nur die Initialisierungsmethode "OnInit" wird �berschrieben,
// der Rest bleibt wie vordefiniert.
class MyApp: public wxApp
{
  virtual bool OnInit();
};

// Dieses Makro expandiert zu einem vordefinierten "main",
// das ein Objekt der Klasse "MyApp" anlegt und initialisiert.
IMPLEMENT_APP(MyApp)

// Die Klasse f�r das Hauptfenster unserer Anwendung:
// Zus�tzlich zur normalen Fenster-Funktionalit�t von wxFrame
// haben wir einen eigenen Konstruktor
// und zwei Methoden f�r Events ("Event Handler")
class MyFrame : public wxFrame
{
  public:
    MyFrame(const wxString &title, const wxPoint &pos, const wxSize &size);
    void OnQuit(wxCommandEvent &event);
    void OnAbout(wxCommandEvent &event);
};

// Nummern f�r unsere Events...
// Hat man mehrere Event-Quellen derselben Art (mehrere Men�s, Buttons, ...),
// so muss man sie durch Nummern unterscheiden
enum
{
  ID_Quit=1,
  ID_About
};

// Start unserer Applikation
bool MyApp::OnInit()
{
  // Hauptfenster anlegen
  MyFrame *frame = new MyFrame("Hello World", wxPoint(50, 50), 
                               wxSize(450, 350));

  // Das Fenster sichtbar machen und ihm den Fokus geben
  frame->Show(true);
  SetTopWindow(frame);

  // Erfolg!
  return true;
}

// Konstruktor f�r das eigene Hauptfenster...
MyFrame::MyFrame(const wxString &title, const wxPoint &pos, const wxSize &size)
  // zuerst einmal: Normales Fenster initialisieren (Vaterklassen-Konstruktor)
  : wxFrame(nullptr, -1, title, pos, size)
{
  // eine neue Menuzeile anlegen ...
  wxMenuBar *menuBar = new wxMenuBar;

  // und ein neues Men� anlegen ...
  wxMenu *menuFile = new wxMenu;

  // ... das zwei Eintr�ge hat
  menuFile->Append(ID_About, "&About...");
  menuFile->AppendSeparator();
  menuFile->Append(ID_Quit, "E&xit");

  // das Men� in die Men�zeile h�ngen
  menuBar->Append(menuFile, "&File");

  // ... und die Men�zeile unseres Fensters auf die neue Men�zeile setzen
  // (das "this" ist unser MyFrame,
  // das SetMenuBar haben wir von wxFrame geerbt)
  SetMenuBar(menuBar);

  // Statuszeile in unserem Fenster einschalten ...
  CreateStatusBar();

  // ... und initialisieren
  SetStatusText("Welcome to wxWidgets!");
  
  // Events mit den dazugeh�rigen Methoden verbinden:
  // - Welche Art von Event?
  // - Mit welcher Methode?
  // - F�r welches Objekt soll diese Methode aufgerufen werden?
  // - Zur Unterscheidung bei mehreren m�glichen Quellen f�r dieselbe Event-Art:
  //   Id des Men�eintrags, Buttons usw., von dem der Event ausgel�st wurde
  //   (kann man weglassen, wenn es nur eine Quelle f�r diese Event-Art gibt)
  Bind(wxEVT_COMMAND_MENU_SELECTED, &MyFrame::OnQuit, this, ID_Quit);
  Bind(wxEVT_COMMAND_MENU_SELECTED, &MyFrame::OnAbout, this, ID_About);
}

// wird aufgerufen, wenn man den Exit-Men�eintrag w�hlt
void MyFrame::OnQuit(wxCommandEvent &WXUNUSED(event))
{
  // MyFrame schlie�en, beendet auch das ganze Programm
  Close(true);
}

// wird aufgerufen, wenn man den About-Men�eintrag w�hlt
void MyFrame::OnAbout(wxCommandEvent &WXUNUSED(event))
{
  // Messagebox anlegen und anzeigen
  // das ist eine normale Funktion (keine Methode),
  // die intern ein wxMessageDialog-Objekt erzeugt
  // das dritte Argument legt fest, mit welchen Buttons & mit welchem Icon
  // das vierte Argument ist das �bergeordnete Fenster (hier das Hauptfenster)
  wxMessageBox("wxWidgets Hello World example.", 
               "About Hello World",
               wxOK|wxICON_INFORMATION, this);
}
