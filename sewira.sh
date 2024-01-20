#!/bin/bash
# SeWiRa - ein Selfmade Wifi Radio
# Erstellt von Steffen Schultz

# Eingabeprompt beschriften
PS3="Sendernummer: "

# Array mit Sendernamen und Stream-Adressen
declare -A STATION
. ./stations.txt

clear
echo "Radiosender auswählen, STRG+C zum Beenden:"

# Sender-Array durchlaufen
select ENTRY in "${!STATION[@]}"; do
  if [ -n "$ENTRY" ]; then # Eingabe korrekt
    TITLE="${ENTRY}"
    URL=${STATION[${ENTRY}]}
    if pidof mpv; then # Falls mpv schon läuft, dann abschießen und anschließend mit dem gewünschten Sender starten
      killall mpv && mpv "$URL" &>/dev/null &
    else # mpv mit dem aufgerufenen Sender starten
      mpv "$URL" &>/dev/null &
    fi
    
    # Falls eine Sprachausgabe konfiguriert ist, sage den Sender an
    if [ -e /usr/bin/espeak-ng ]; then
      /usr/bin/espeak-ng -v de -a 200 -s 400 "$TITLE wird abgespielt"
    fi
  else # Sendernummer ungültig
    echo "Ungültige Eingabe"
  fi
done
