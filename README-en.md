<p align="right"><a href="README-en.md">English</a> &nbsp; <a href="README.md">Deutsch</a></p>

# SeWiRa
A self-made Wifi Radio.

## Introduction

One day I asked myself: How easy can it be to build a Wifi radio without using soldering irons, 3D printers, or a degree in computer science? Well, this project was the result. My Wifi radio consists of a Raspberry Pi with Raspberry Pi OS Lite, an external sound card, a numeric keypad as remote control and any active speaker or amplifier. SeWiRa is the software component for the radio and can be used not just in this project. It is a shell script that creates a station menu from a directory of m3u files. The stations are numbered and can be selected using the numeric keypad. The principle is similar to old shortwave receivers, where you only had to enter the correct frequency for the desired station. The radio can therefore be used completely without a screen; direct or remote access is of course required to edit the station list. You'll have to forgo the comfort of having a station database with thousands of programs from normal Wifi radios, but with this project you'll get a reliable radio that won't give you any nasty surprises if the portal operator cuts off database access. And if the station operator changes his stream, it is a matter of minutes to enter the new address in the station menu. 

## Setup

### Requirements

* Every Linux or unix-like system capable of running bash scripts. A Raspberry Pi running Raspberry Pi OS Lite will work.
* [MPV](https://mpv.io/) for stream playback. Can be easily adjusted for other players, they only should be able to play radio streams. 
* [eSpeak NG](https://github.com/espeak-ng/espeak-ng), for announcing station names.

### Installation

* Clone or [Download this repository](https://github.com/schulle4u/sewira/archive/refs/heads/main.zip) into any folder, e.g. `/home/username/sewira`. 
* Make `sewira` executable: `chmod +x ./sewira`
* Change into the `streams` directory, and add your m3u files. One stream per file. Some german example stations are already available.
* Optionally: For more convenience, open the file `~/.profile`  and add a call for `sewira` at the bottom. This will ensure that the station list is active upon login or system startup, if you have configured auto-login. 
* Optionally: Add a shell alias to bring back the menu after closing the radio without restarting the system, e.g. `alias 0=~/sewira/sewira`

Sewira also can be installed as system-wide command. Enter `sudo make install` in the source code directory if you wish to do this. The example streams will be located at `$HOME/sewira/streams/`. 

## Usage

After calling `sewira` a menu with numbered stations appears. The desired channel is activated by typing the displayed number and pressing Enter. If a channel is not available, an error message is displayed. Press 0 to exit the menu. The channels are sorted by filename, usually alphabetically. By prefixing the filename with a number, you can influence the sorting like in a playlist. MPV is used for playback, but the player is only active in the background to keep the station menu open for the next input. It is therefore not possible to control the player itself. 

You can also start Sewira with a different streams directory, e.g. `sewira /home/username/sewira/more-streams/`. 

## More information and similar projects

* [RadioBrowser](https://radio-browser.info): A community-maintained database of stream URLs.
* [Terminal Radio](https://github.com/shinokada/tera): Another TUI radio, but with much more options and using radio-browser as station database. 

## Development

Steffen Schultz. Use at own risk, your house can explode! 😁
