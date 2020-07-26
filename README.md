# M.I.L
MyCroft Interface Linux is a very simple
program, script, to display a graphical interface 
for MyCroft Open Source AI.
For more information about MyCroft go to https://mycroft.ai

I wrote this script and made some graphics, some from internet,
some i made myself. If anybody has a problem with a graphics file
i use, please let me know so i can remove and replace it.
The script presents a graphical interface to MyCroft. If Mycroft
speaks it will show a graphical representation of that.

It currently has 4 themes:

* J.A.R.V.I.S - fullscreen or windowed
* STAR TREK   - LCARS interface
* K.I.T.T     - NightRider black/clean
* NONE        - Headless mode, usefull to exercise your pronoucing



It is nowhere professional or ment to be professional. 

I hope you will enjoy it, if not though luck :)
--------------------------------------------------------------------

# Installation

Please read carefully otherwise it might be one big disapointment.

## Requirements

What external programs do you need to run MyCroft Interface Linux?

* pqiv - simple graphics viewer
* feh - even more simple but powerfull graphics view
* mpg123 - audio converter, pre-installed on most Linux Distro's (installed by Mycroft also)
* bash shell - pre-installed
* zenity - GUI for shell commands
* mplayer - for media files like radio streams

## How to install

1. make a folder $HOME/mycroft_interface_linux

2. unzip all the files into the folder $HOME/mycroft_interface_linux

3. open a terminal, xterm, gnome-terminal etc

4. `cd $HOME/mycroft_interface_linux`

5. `./mycroft_visal.sh or bash mycroft_visal.sh `

This program uses the file: `/var/log/mycroft/voice.log` to function properly
this log file is automatically activated when starting with: mycroft-start all

# Usage

## New commands

say: "exit interface" - will go back to the main menu

say: "switch to jarvis small" - will switch to the J.A.R.V.I.S windowed theme

say: "switch to jarvis full" - will switch to the J.A.R.V.I.S fullscreen theme

say: "switch to star trek"  - will switch to the STAR TREK theme

say: "switch to nightrider" - will switch to the nightrider theme

say: "show commands" - will show these commands

say: "stream radio" - will play radio stream of KISS FM Ukraine, uses mplayer
set your own favorite channel https://www.xatworld.com/radio-search/

say: "stop streaming radio" - will stop radio stream


Thats it! Hope you enjoy!

# Changelog

UPDATE: 12/19/2019

- Fixed some enoying bugs
- Added Radio
- Added headless mode, usefull to exercise your pronoucing

Bastiaan
