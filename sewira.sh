#!/bin/bash
# SeWiRa - ein Selfmade Wifi Radio
# Copyright (c) 2024 Steffen Schultz

# Einige Pfade
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MPVBIN="/usr/bin/mpv"
TTSBIN="/usr/bin/espeak-ng"
STREAMS=$SCRIPT_DIR"/streams/"

# Eingabeprompt beschriften
PS3="Sendernummer: "

# Sleeptimer beim Starten des Senders, Wert erhöhen falls es zu Überlappungen bei Verwendung der Sprachausgabe kommt
SLEEPTIMER="0.5"

# Sprachausgabenfunktion
speaktext() {
  if [ -e "$TTSBIN" ]; then
    "$TTSBIN" -v de -a 100 -s 300 "$1" &>/dev/null &
  fi
}

clear

# Spreche eine Willkommensmeldung falls Sprachausgabe installiert ist
speaktext "Willkommen bei Sewira! Radiosender auswählen, 0 zum Beenden eingeben"

# Bildschirmmeldung über der Senderliste
echo "Willkommen bei Sewira!"
echo "Verzeichnis der Streamdateien: $STREAMS"
echo "Radiosender auswählen, 0 zum Beenden eingeben:"

# Array mit Sendernamen und Stream-Adressen definieren und einlesen
FILES=("$STREAMS"/*.m3u)

if [ ! -e "$FILES" ]; then
  echo "Keine gültigen Streams gefunden"
else
  # Sender-Array durchlaufen
  COLUMNS=1 # Vermeide mehrspaltige Anzeige bei längeren Senderlisten
  select ENTRY in "${FILES[@]##*/}"; do

    if [[ -n "$ENTRY" ]]; then # Eingabe korrekt
      TITLE="$ENTRY"
      URL=$(grep -oE "http[s]?://\S+" "$STREAMS$ENTRY")

      # Abspielbefehle
      if pidof mpv; then # Falls mpv schon läuft, dann abschießen und anschließend mit dem gewünschten Sender starten
        killall mpv && sleep "$SLEEPTIMER" && "$MPVBIN" "$URL" &>/dev/null &
      else # mpv mit dem aufgerufenen Sender starten
        sleep "$SLEEPTIMER" && "$MPVBIN" "$URL" &>/dev/null &
      fi
    
      # Falls eine Sprachausgabe konfiguriert ist, sage den Sender an
      speaktext "$TITLE wird abgespielt"
    
    else # Sendernummer ungültig
      echo "Ungültige Eingabe"
      speaktext "Radio wird beendet."
      if pidof mpv; then # Vor dem exit ein eventuell laufendes MPV beenden
        killall mpv
      fi
      exit 1 # Skript wird beendet
    fi
  done
fi
