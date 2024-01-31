#!/bin/bash
# SeWiRa - the Selfmade Wifi Radio
# Copyright (c) 2024 Steffen Schultz

# Configure some paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MPVBIN="/usr/bin/mpv"
TTSBIN="/usr/bin/espeak-ng"
STREAMS=$SCRIPT_DIR"/streams/"

# Change the default PS3 prompt for program number input
PS3="Sendernummer: "

# Sleep between station announcement and  playback. Increase to avoid overlapping
SLEEPTIMER="0.5"

# Text to speech function
speaktext() {
  if [ -e "$TTSBIN" ]; then
    "$TTSBIN" -v de -a 100 -s 300 "$1" &>/dev/null &
  fi
}

clear

# Speak a welcome message
speaktext "Willkommen bei Sewira! Radiosender auswählen, 0 zum Beenden eingeben"

# On-screen messages above the station list
echo "Willkommen bei Sewira!"
echo "Verzeichnis der Streamdateien: $STREAMS"
echo "Radiosender auswählen, 0 zum Beenden eingeben:"

# Define our array of files from the streams directory
FILES=("$STREAMS"*.m3u)

if [ ! -e "$FILES" ]; then # No valid streams are available
  echo "Keine gültigen Streams gefunden"
else # Build the menu
  COLUMNS=1 # Avoid multiple columns for better readability
  select ENTRY in "${FILES[@]##*/}"; do

    if [[ -n "$ENTRY" ]]; then # Station exists
      TITLE="$ENTRY"
      URL=$(grep -oE "http[s]?://\S+" "$STREAMS$ENTRY")

      # Playback commands
      # We don't want mpv to shove off our menu, therefore send it into background
      if pidof mpv; then # Kill an already playing mpv instance before starting the next stream
        killall mpv && sleep "$SLEEPTIMER" && "$MPVBIN" "$URL" &>/dev/null &
      else # Simply start the stream
        sleep "$SLEEPTIMER" && "$MPVBIN" "$URL" &>/dev/null &
      fi
    
      # Announce station name
      speaktext "$TITLE wird abgespielt"
    
    else # Invalid program number, kill the menu
      echo "Ungültige Eingabe"
      speaktext "Radio wird beendet."
      if pidof mpv; then # Kill a possibly running mpv
        killall mpv
      fi
      exit 1 # Bye bye
    fi
  done
fi
