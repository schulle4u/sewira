<p align="right"><a href="README-en.md">English</a> &nbsp; <a href="README.md">Deutsch</a></p>

# SeWiRa
Ein Selfmade Wifi Radio.

## Hintergrund

Wie einfach kann es sein, ein WLAN-Radio zu bauen, ohne auf Lötkolben, 3d-Drucker oder ein Informatikstudium angewiesen zu sein? Diese Frage habe ich mir gestellt und dabei ist dieses Projekt entstanden. Mein WLAN-Radio besteht aus einem Raspberry Pi mit Raspberry Pi OS Lite, dazu eine externe Soundkarte, ein Ziffernblock als Fernbedienung sowie ein beliebiger Aktivlautsprecher oder HiFi-Verstärker. SeWiRa ist die Softwarekomponente für das Radio, und kann beliebig eingesetzt werden. Es ist ein Shell-Skript, welches aus einem Verzeichnis mit M3u-Dateien ein Sendermenü erstellt. Die einzelnen Sender werden nummeriert und lassen sich über den Ziffernblock ansteuern. Das Prinzip ähnelt alten Kurzwellenempfängern, bei denen man nur die richtige Frequenz eingeben musste. Das Radio kann daher völlig ohne einen Bildschirm genutzt werden, lediglich für das Bearbeiten der Senderliste ist natürlich ein Zugang notwendig. Auf die von normalen WLAN-Radios gewohnte Senderdatenbank mit tausenden von Programmen muss man allerdings verzichten, bekommt mit diesem Projekt aber ein zuverlässig funktionierendes Radio, das einem keine bösen Überraschungen bereitet, wenn der Portalbetreiber den Datenbankzugang abschaltet. Und sollte der Senderbetreiber seinen Stream ändern, ist es eine Frage von Minuten, die neue Adresse im Sendermenü zu hinterlegen. 

## Einrichtung

### Voraussetzungen

* Im Grunde Jedes Linux oder Unix-artige System, welches zur Soundausgabe und Ausführung von Bash-Skripts in der Lage ist. Ein Raspberry Pi mit Raspberry Pi OS Lite reicht völlig.
* [MPV](https://mpv.io/) für die Wiedergabe der Streams. Der Player ist in den Paketquellen vieler Distributionen bereits vorhanden. Natürlich kann mit wenigen Handgriffen eine andere Software konfiguriert werden, sie sollte nur in der Lage sein, Radiostreams abzuspielen.
* [eSpeak NG](https://github.com/espeak-ng/espeak-ng), falls eine Ansage der Sender gewünscht wird. 

### Installation

* Das Repository clonen oder [Alle Dateien herunterladen](https://github.com/schulle4u/sewira/archive/refs/heads/main.zip) und in einem beliebigen Ordner entpacken, z. B. nach `/home/Benutzer/sewira`. 
* Im Ordner die Datei `sewira.sh` ausführbar machen: `chmod +x ./sewira.sh`
* Im Unterverzeichnis `streams` die M3u-Dateien für die gewünschten Sender ablegen. In jeder Datei sollte nur ein Stream vorhanden sein. Einige deutschsprachige Beispielsender sind bereits vorhanden.
* Optional: Ans Ende der Datei `~/.profile` einen Aufruf zur `sewira.sh` hinterlegen. Bei Systemen mit automatischem Login startet sich dann direkt das Radiomenü und man benötigt nur noch den Ziffernblock. 
* Optional: Einen Shell-Alias anlegen, um das Sendermenü auch per Ziffernsteuerung nach dem Beenden des Radios wieder aufrufen zu können, z. B. mit `alias 0=~/sewira/sewira.sh`

## Verwendung

Nach dem Aufruf von `sewira.sh` erscheint ein Menü mit nummerierten Sendern. Der gewünschte Sender wird durch Eingabe der dargestellten  Nummer und Enter aktiviert. Ist ein Sender nicht vorhanden, erfolgt eine entsprechende Fehlermeldung. Die ziffer 0 beendet das Menü. Die Sortierung der Sender erfolgt anhand des  Dateinamens, also in der Regel alphabetisch. Durch das Voranstellen einer Ziffer am Dateinamen kann die Sortierung wie in einer Playliste beeinflusst werden. Für die Wiedergabe wird MPV verwendet, jedoch ist der Player nur im Hintergrund aktiv, damit das Sendermenü immer für die nächste Eingabe geöffnet bleiben kann. Eine Steuerung des Players ist daher nicht vorgesehen. 

## Weitere Informationen und Projekte

* [RadioBrowser](https://radio-browser.info): Eine Datenbank zum Auffinden direkter Streamadressen für eure Favoritenliste.
* [Terminal Radio](https://github.com/shinokada/tera): Ein weiteres Internetradio im Textmodus, jedoch sehr viel umfangreicher und mit RadioBrowser-Zugriff. 

## Entwicklung

Steffen Schultz. Nutzung auf eigene Gefahr, euer Haus könnte explodieren! 😁
