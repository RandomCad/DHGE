# ATMega
Dieses Repository enthält den Code für die gleichnamige Vorlesung an der DHGE zum Thema ATMega Mikrocontroller.

## Kompatibilität
Eine Kompatibilität zum Code in der Vorlesung kann nicht garantiert werden, da unterschiedliche Assembler verwendet werden. 
Im Projekt wird die Verwendung des `avra` Assemblers vorgeschlagen. Der Dozent scheint den `as` zu verwenden. Dies ist der GNU Assembler.  
Incompatibel sind dabei insbesondere Kommentare. Der `as` scheint auch `//` commentare correct zu verarbeiten. `avra` Versteht diese nicht correct.

## Kompilieren des Codes

Folgen Sie den Anweisungen unten, um die Programme zu kompilieren. 

### Unter Linux
Das Verfahren basiert auf der Anleitung auf der Webseite [Assembly Program Arduino on Linux with AVRA](https://www.hackster.io/patrick-fitzgerald2/assembly-program-arduino-on-linux-with-avra-2ee3a6).  
Die folgenden Linux-Pakete werden benötigt:
1. avra
2. avrdude  

Installation mit den Befehlen    
`sudo apt install avra && sudo apt install avrdude`.  

Zum Kompilieren verwenden Sie avra. Zum Beispiel kann folgendes benutzt werden:  
`avra count.asm`  
Zum Übertragen verwenden sie die HaJo-Verbindung in der UNI. Wenn sie diese benutzen können, können sie den folgenden Befehl benutzen, um das kompilierte Programm zu übertragen.    
`avrdude -p atmega328p -c avrispmkii -P usb -U flash:w:count.hex:i`  

### VS-Code
Wenn sich die in .vscode/launch.json angegebene Launch-Konfiguration im .vscode-Ordner des aktuellen Workspaces befindet, kann bei geöffneter .asm-Datei F5 gedrückt werden, um diese automatisch zu kompilieren und auf den Mikrocontroller zu flashen.

## Sprache
Dieses Repository wird nicht nur in einer Sprache gepflegt. Die Hauptsprache sollte Englisch bleiben. Die Verwendung der deutschen Sprache, wie z.B. in diesem Dokument, wird jedoch erwartet.
