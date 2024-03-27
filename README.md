# ATMega
Dieses Repository enthält den Code für die gleichnamige Vorlesung an der DHGE zum Thema ATMega-Mikrocontroller.

## Kompilieren des Codes

Befolgen Sie die untenstehenden Anweisungen zum Kompilieren der Programme. 

### Unter Linux
Das Verfahren basiert auf der Anleitung in der Webseite [Assembly Program Arduino on Linux with AVRA](https://www.hackster.io/patrick-fitzgerald2/assembly-program-arduino-on-linux-with-avra-2ee3a6).  
Benötigt werden die folgenden Linux-Pakete:
1. avra
2. avrdude  

Installation durch die Befehle:    
`sudo apt install avra && sudo apt install avrdude`  

Zum Kompilieren verwenden sie avra. Folgendes kann beispielsweise verwendet werden:  
`avra count.asm`  
Zum Übertragen verwenden sie die ... Verbindung. Sofern sie diese verwenden können, können sie den folgenden Befehl zum Übertragen des compilierten Programms verwenden.    
`avrdude -p atmega328p -c avrispmkii -P usb -U flash:w:count.hex:i`  

### VS-Code
Befindet sich die unter .vscode/launch.json angegebene Launch-Konfiguration im .vscode-Ordner des aktuellen Workspaces, kann bei geöffneter .asm-Datei F5 gedrückt werden, um diese automatisch zu kompilieren und auf den Microcontroller zu flashen.

## Sprache
Dieses Repository wird nicht eindeutig in einer Sprache geführt werden. Die Hauptsprache sollte weiterhin Englisch sein. Eine verwendung von Deutsch wie beispielsweise in diesem Dokument ist aber erwartet.
