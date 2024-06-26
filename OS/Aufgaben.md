# Einleitung
Nachfolgend eine Samlung an Aufgaben. Wenn es sich um Code handelt werden die Punkte mit # preifixed in (...) je zeile angegeben.
  
## Aufgabe 1
Schreiben sie ein script, welches alle Datein in einem Angegebenen Ordner in das folgende Namensschema umwandelt:
\<nummer\>Datei  

    #! /usr/bin/bash                    # (1)
    #Variablen erstellen
    Folder=$1                           # (1)
    num=0             
    #Alle existirende Datein werden durchgegange
    for i in $(ls $Folder); do          # (1)
      #Neubenenung nach dem Schema
      mv $Folder/$i $Folder/Datei$num   # (1)
      ((num++))                         # (1)
    done
  
## Aufgabe 1b
Stellen sie sicher, dass das soeben geschriebene script auch mehrfach ausgeführt werden kann! (schwer)

    #! /usr/bin/bash
    #Variablen erstellen
    Folder=$1                                                   
    num=0
    
    # Überprüft, ob Bereits Datein nach dem Gegebenen namenschema existiren
    if ls $Folder | grep -q 'Datei'; then                         # (1)
      # Es werden alle Dateien durchgegangen um die Hochstwertige Datei zu finden
      for i in $(ls $Folder | grep '.*Datei'); do                 
        if ((num <= $(echo $i | grep -o '[1234567890]*'))); then  # (2)
          # Stellt sicher, dass num korekt beginnt
          num=$(echo $i|grep -o '[1234567890]*')                  # (1)    
          # wird benötigt, damit nicht die Datei selbst überschrieben wird
          ((num++))                                               # (1)
        fi
      done
    fi
    
    #Alle existirende Datein werden durchgegange
    for i in $(ls $Folder); do          # (1)
      #Neubenenung nach dem Schema
      mv $Folder/$i $Folder/Datei$num   # (1)
      ((num++))                         # (1)
    done

## Aufgabe 2
Zur Aktivierung von ip forwarding muss in der Datei *sysctl.conf* die folgende Zeile stehen: 
`ipforward=1`. Diese Zeile kann entwede in der Datei mit `# ipforward=1` auskommentiert sein, garnicht angegeben sein oder mit `ipforward=0` angegeben sein. Schreiben sie ein Programm, welches die Konfiguration fornimmt und dabei die Datei nicht unnötig verlängert. Beachten sie auch, das weitere Konfigurationen durch `#` in der Datei auskommentiert sein könnten.

    if grep -q '#ipforward=.' sysctl.conf ; then        # (1)
      sed -i 's/#ipforward=./ipforward=1/' sysctl.conf  # (1)
    elif grep -q 'ipforward=.' sysctl.conf ;then        # (1)
      sed -i 's/ipforward=./ipforward=1/' sysctl.conf   # (1)
    else
	    echo 'ipforward=1' >> sysctl.conf                 # (1)
    fi

## Aufgabe 3
Geben sie 4 Betriebssystem unterschiedlicher Firmen an, welche in Virtualbox verwendet werden können:
1. Windows * (95, 98, XP, Vista, 7,8,10,11,...)
2. Ubuntu
3. Kubuntu
4. Lubuntu
5. Debian
6. Weitere Linux Distreabutionen
7. Mac OS X und alle forgänger Modelle
8. FreeBSD
Es sollte pro Betriebssystem maximal 1 Punkt geben. Halbe punkte wären auch möglich.  

## Aufgabe 4
Erklären sie die wichtigesten unterscheidungsmerkmale zwischen Linux und einer Linux Distribution.
Erwartet sind 4 punkte:
* Linux ist ein Kernel \<-\> Disros
  * Kernal ist die basis eines Betriebsystemes -> stellt elementare funktionen bereit
  * Distribution stellt software über dem Kernal zur Nutzung des Kernels bereit -> Graphick -> einfachere Programmaufrufe -> ...
* 

## Aufgabe 5
Nenen und geben sie ein Verwendungsbeispiel für zwei befehle an, welche zum Überprüfen von Netzwerkverbindungen genutzt werden können. (2 oder 4 Punkte)  
`ping 192.168.0.2`  
`iperf3 -c 192.168.0.2`  
`tracepath 192.168.0.2`

## Aufgabe 6
Da Herr de Montmollin gerne mit Markdown files arbeitet muss er diese reglmäßig in pdf umwandeln. 
Hierzu verwendet Herr de Montmollin momentan den folgenden befehl: `pandoc --from=gfm --to=pdf -o test.pdf [file.md]`.  
Die länge dieses Befehles findet Herr de Montmollin lästig. Deswegen wünscht er nur ein Kürzel für den befehl angeben zu müssen. Geben sie seine angabe auf der CLI an um sein Ziel zu erreichen. Benennen sie die teile des Befehles.
Der Herr wünscht dabei nur den in *[]* eingeschlossenen bereich noch zu verändern. 
Zeigen sie auch die verwendung an einem Beispiel. (3 Punkte)  
`alias m2p='pandoc --from=gfm --to=pdf -o test.pdf'`    # (1)  
-----|------|    
Befehl  Argument                                # (2)  

`m2p Aufgaben.md` # (1)

## Aufgaben 7
### Teil a
Geben sie 6 unterschiedliche Partitionsformate an: (3)
* Ext 4/3/2
* NTFS
* Fat 16/32/64
* Luks
### Teil b
Geben sie mit den Nachkommenden informationen den Befehl zu mounten der NTFS Partition /dev/nvmeon1p7 an einer belibigen stelle im Linux betriebssystem an. (3)

    NAME
           mount - mount a filesystem

    SYNOPSIS
           mount [-h|-V]
    
           mount [-l] [-t fstype]
    
           mount -a [-fFnrsvw] [-t fstype] [-O optlist]
    
           mount [-fnrsvw] [-o options] device|mountpoint

           mount [-fnrsvw] [-t fstype] [-o options] device mountpoint
    
           mount --bind|--rbind|--move olddir newdir
    
           mount --make-[shared|slave|private|unbindable|rshared|rslave|rprivate|runbindable]
           mountpoint
    
    DESCRIPTION
           All files accessible in a Unix system are arranged in one big tree, the file hierarchy,
           rooted at /. These files can be spread out over several devices. The mount command serves
           to attach the filesystem found on some device to the big file tree. Conversely, the
           umount(8) command will detach it again. The filesystem is used to control how data is
           stored on the device or provided in a virtual way by network or other services.
    
           The standard form of the mount command is:
    
              mount -t type device dir
    
           This tells the kernel to attach the filesystem found on device (which is of type type) at
           the directory dir. The option -t type is optional. The mount command is usually able to
           detect a filesystem. The root permissions are necessary to mount a filesystem by default.
           See section "Non-superuser mounts" below for more details. The previous contents (if any)
           and owner and mode of dir become invisible, and as long as this filesystem remains mounted,
           the pathname dir refers to the root of the filesystem on device.
    
  `sudo mount -t ntsf /dev/nvme0n1p7 /media/test/test
    
## Aufgabe 8
Nenen 4 wege konfigurationsdateien auf einen neuen unkofigurierten Linux zu übertragen:
* git
* sftp
* USb-Stick
* Flashdirive
* Download von einer Webseite

