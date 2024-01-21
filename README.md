# SeWiRa
Ein Selfmade Wifi Radio.

## Entstehung

In einer Zeit, als man internationales Radio noch über die Kurzwelle hörte, gab es Geräte mit direkter Frequenzeingabe per Zehnertastatur. Die neuesten Nachrichten aus nahezu jedem Land waren Tag und Nacht verfügbar, kannte man nur die korrekte Frequenz eines Kurzwellensenders. Heute sind die möglichkeiten zum Empfang weltweiter Sender natürlich ganz andere, und niemand möchte sich tausende von Stream-Adressen merken müssen. Daher gibt es große Datenbanken, welche diese Arbeit übernehmen und jedem Internetradio ein umfangreiches Menü mit zehntausenden Sendern zur Verfügung stellen, aus denen man sich gegebenenfalls seine Favoriten erstellen kann. Auch haben viele dieser Radios mehrere Direktwahltasten, was einem die ständige Suche in den Menüs erspart. Doch so bequem diese Portale auch sind, so riskant kann es sein, sich allein auf sie zu verlassen. Ändert der Betreiber die Nutzungsbedingungen oder technischen Voraussetzungen seiner Software, wird so manches Gerät schnell mal zu Elektroschrott, wenn plötzlich der Zugriff auf die Lieblingssender nicht mehr möglich ist. bestenfalls kann man sein Radio dann wenigstens noch als Aktiv-Lautsprecher für andere Geräte verwenden. Genau hier springt meine Idee ein. 

SeWiRa (Selfmade Wifi Radio) versucht dabei nicht das Rad(io) neu zu erfinden. Stattdessen habe ich ein sehr einfaches Bash-Skript erstellt, um per Knopfdruck ausschließlich meine Lieblingssender auf Abruf zu haben. Statt einer riesigen Datenbank muss man sich einmalig nur seine Lieblings-Streams zusammensuchen und sie in einer Liste hinterlegen. Das Skript erstellt daraus ein Menü, in welchem die Stationen durchnummeriert werden. Einmal eingerichtet, lassen sich die Sender dann ganz einfach per Tastatur oder wie in meinem Fall per externem Ziffernblock abrufen, eben wie bei einem klassischen Radio mit Frequenzeingabe - nur noch etwas einfacher. Das Skript kann auf jedem beliebigen Linux-System laufen, wobei sich hier natürlich ein Raspberry Pi sehr gut anbietet. Mit etwas Bastelarbeit kann man diesen dann z. B. in einem Gehäuse mit aktivem Lautsprecher unterbringen. Externe Ziffernblöcke gibt es auch als Funkausführung, sodass man letztendlich ein eigenes WLAN-Radio mit Fernbedienung gebaut hat. Ansätze für Internetradios im Eigenbau gibt es zwar einige, doch diese erfordern nicht selten handwerkliche Kenntnisse oder haben eine Bildschirm-Bedienung zum Ziel. Ich wollte für mich selbst einfach den Beweis antreten, dass es auch mit weniger Aufwand geht, wenn man ohnehin nur eine Hand voll Sender tagtäglich hört. Um neue Sender zu entdecken nutze ich in der Regel geeignetere Werkzeuge. 

## Einrichtung

### Voraussetzungen

* Im Grunde Jedes Linux oder Unix-artige System, welches zur Soundausgabe und Ausführung von Bash-Skripts in der Lage ist. Ein Raspberry Pi mit Raspberry Pi OS Lite reicht völlig.
* [MPV](https://mpv.io/) für die Wiedergabe der Streams, ist in den Paketquellen vieler Distributionen bereits vorhanden.
* [eSpeak NG](https://github.com/espeak-ng/espeak-ng), falls eine Ansage der Sender gewünscht wird.

### Installation

* [Alle Dateien herunterladen](https://github.com/schulle4u/sewira/archive/refs/heads/main.zip) und in einem beliebigen Ordner entpacken, z. B. nach `/home/Benutzer/sewira`. 
* Im Ordner die Datei `sewira.sh` ausführbar machen: `chmod +x ./sewira.sh`
* In der Datei `stations.txt` die gewünschten Streams eintragen. Die korrekte Syntax wird an einem Beispiel veranschaulicht. 
* Optional: Ans Ende der Datei `~/.profile` einen Aufruf zur `sewira.sh` hinterlegen. Bei Systemen mit automatischem Login startet sich dann direkt das Radiomenü und man benötigt nur noch den Ziffernblock. 
* Optional: Einen Shell-Alias anlegen, um das Sendermenü auch per Ziffernsteuerung wieder aufrufen zu können, z. B. mit `alias 0=~/sewira/sewira.sh`

## Verwendung

Nach dem Aufruf von `sewira.sh` erscheint ein Menü mit nummerierten Sendern. Der gewünschte Sender wird durch eingabe der dargestellten Nummer und Enter aktiviert. Ist ein Sender nicht vorhanden, erfolgt eine entsprechende Fehlermeldung und das Skript wird beendet. (Ja, ziemlich unelegante Ausschaltfunktion mit Optimierungsbedarf. 😁) Für die Wiedergabe wird MPV verwendet, jedoch ist der Player nur im Hintergrund aktiv, damit das Sendermenü immer für die nächste Eingabe geöffnet bleiben kann. Eine Steuerung des Players ist daher nicht vorgesehen. 

## Danksagung

All den fleißigen der schreibenden Zunft, die mir mit ihren Mails und ungezählten Tutorials helfen das Mysterium Shell zu verstehen, um mein erstes Projekt dieser Art ins Leben zu rufen. 

## Weitere Informationen und Projekte

* [RadioBrowser](https://radio-browser.info): Eine Datenbank zum Auffinden direkter Stream-Adressen für eure Favoritenliste.
* [Terminal Radio](https://github.com/shinokada/tera): Ein weiteres Internetradio im Textmodus, jedoch sehr viel umfangreicher und mit RadioBrowser-Zugriff. 
