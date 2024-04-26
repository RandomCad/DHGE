# 26.04.2024
Über DDRx wird gesetzt, ob gelesen oder Geschreiben wird. Bei 0 wird gelesen. 
In diesme falle kann über das Scchreiben des PORTx wertes der Pull-Up/Dow weiderstands type gesetzt werden. 
Das register PINx, dient nur zum lesen der Pins. Beim schreiben liegt eine verzögerung von 2 Tackten for. 

# ASM Befehle:
* LDI: Lode direct imidiate. `LDI R, N` lade Zahl N in Register R.
* OUT:
* SBI: `SBI PORTx, 0` setzte das 0-Bit von PORTx
* CBI: das inverse von SBI

