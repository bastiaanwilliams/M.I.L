#!/bin/bash
#
##############################################
#					     #
# Simple but effective script to display     #
# an atractive interface for MyCroft.	     #
# Lots of room for improvement, i know.      #
#					     #
#					     #
# Feel free to use, edit, change,destroy.    #
# 					     #
##############################################
#
#
cd $HOME/mycroft-interface-linux/
# kill all instances of feh,pqiv,mpg123
pkill -f pqiv
pkill -f feh
pkill -f mpg123 


# menus
# catch last spoken words to send to notify area
catchwords() {
if [ $notify -eq 1 ] ; then
last=`tail -1 /var/log/mycroft/voice.log | grep Utterance: |wc -l`
expr $last + 0
if [ $last -eq 1 ] ; then
last=`tail -1 /var/log/mycroft/voice.log | grep Utterance | cut -c90-| tr -d '"]'| tr -d "[:punct:]"`
notify-send "Jarvis: $last"
fi
else
notify = 0;
fi
}


# jarvis theme
jarvissmall() {
jarvis=1
startrek=0
kitt=0
ani1=images/jarvis2_talk_small.gif
ani2=images/jarvis2_small.gif
#feh -F --zoom fill jarvis_full.jpg &
pqiv -c -l -i images/jarvis_small.png &
processIDA=$(ps -ef | grep 'pqiv' | grep -v 'grep' | awk '{ printf $2 }')
while true;
do
#sleep 1 | you can put a sleep in here to minimize the load

test=`ps x | grep 'mpg123 /tmp/mycroft' | grep -v 'grep' | wc -l`;
expr $test + 0

if [ $test -gt 0 ] ; then

testme=`ps x | grep $ani1 | grep -v 'grep' | wc -l`
expr $testme + 0
if [ $testme -gt 0 ] ; then

echo "0" > /dev/null
else
kill -9 $PQ

exitinterface
switchinterface
catchwords
pqiv -i -l -c $ani1 &
PQ=$!

fi
else
night=0
night=`ps x | grep $ani2 | wc -l`;
expr $night + 1
if [ $night -gt 1 ] ; then 
echo 0 > /dev/null
else
exitinterface
switchinterface
catchwords
night=0
kill -9 $PQ
pqiv -i -l -c $ani2 &
PQ=$!


fi
fi

done
kill -9 $processIDA
}

# jarvis theme fullscreen
jarvisfull() {
jarvis=1
startrek=0
kitt=0
ani1=images/jarvis2_talk_full.gif
ani2=images/jarvis2_full.gif
feh -F --zoom fill images/jarvis_full.jpg &

processIDA=$(ps -ef | grep 'pqiv' | grep -v 'grep' | awk '{ printf $2 }')
while true;
do
#sleep 1 | you can put a sleep in here to minimize the load

test=`ps x | grep 'mpg123 /tmp/mycroft' | grep -v 'grep' | wc -l`;
expr $test + 0

if [ $test -gt 0 ] ; then

testme=`ps x | grep $ani1 | grep -v 'grep' | wc -l`
expr $testme + 0
if [ $testme -gt 0 ] ; then

echo "0" > /dev/null
else
kill -9 $PQ

exitinterface
switchinterface
catchwords
pqiv -i -l -c $ani1 &
PQ=$!

fi
else
night=0
night=`ps x | grep $ani2 | wc -l`;
expr $night + 1
if [ $night -gt 1 ] ; then 
echo 0 > /dev/null
else
exitinterface
switchinterface
catchwords
night=0
kill -9 $PQ
pqiv -i -l -c $ani2 &
PQ=$!


fi
fi

done
kill -9 $processIDA
}

# star trek theme
startrek() {
startrek=1
jarvismall=0
jarvisfull=0
kitt=0
date="CREW MEMBER: `whoami`";
mycroft=`tail -6 /var/log/mycroft/voice.log | grep "hey jarvis" | wc -l`
expr mycroft
if [ $mycroft -gt 0 ];then
mycroft="Say [ Hey Jarvis ] to activate"
else
mycroft="Computer is listing..."
fi

convert -font helvetica -pointsize 34 -fill white -draw "text 1245,190 '$date' " images/startrek_bg.jpg images/startrek_bgnew.jpg
convert -font helvetica -pointsize 16 -fill white -draw "text 840,690 '$mycroft' " images/startrek_bgnew.jpg images/startrek_bgnew.jpg       
feh -F images/startrek_bgnew.jpg &
processIDB=$(ps -ef | grep 'feh' | grep -v 'grep' | awk '{ printf $2 }')

while true;
do

#sleep 1 | you can put a sleep in here to minimize the load

test=`ps x | grep 'mpg123 /tmp/mycroft' | grep -v 'grep' | wc -l`;
expr $test + 0

if [ $test -gt 0 ] ; then

testme=`ps x | grep  $ani1 | grep -v 'grep' | wc -l` 
expr $testme + 0
if [ $testme -gt 0 ] ; then

echo "0" > /dev/null
else
exitinterface
switchinterface
catchwords
kill -9 $PQ
expr $startrek + 0
if [ $startrek -eq  1 ] ; then
we=`tail -1 /var/log/mycroft/voice.log | grep "weather" | wc -l`
ne=`tail -1 /var/log/mycroft/voice.log | grep "the news" | wc -l`
expr $ne + 0
expr $we + 0
if [ $we -eq 1 ] ; then
ani1=images/wwoman.gif 
we=1
fi
if [ $ne -eq 1 ] ; then
ani1=images/news.gif
ne=1
fi
ne=`expr $ne + $we`
if [ $ne -eq 0 ] ; then
ani1=images/tenor.gif
fi
fi
pqiv -i -l -c $ani1 &
PQ=$!
fi
else
night=0
night=`ps x | grep $ani2 | wc -l`;
expr $night + 1
if [ $night -gt 1 ] ; then 
echo 0 > /dev/null
else
exitinterface
switchinterface
catchwords
night=0
kill -9 $PQ

pqiv -i -l -c $ani2 &
PQ=$!
fi
fi
done
kill -9 $processIDA
}

# kitt theme
kitt() {
kitt=1
jarvismall=0
jarvisfull=0
startrek=0
feh -F images/black.gif &
ani1=images/fast.gif
ani2=images/night.gif
processIDB=$(ps -ef | grep 'feh' | grep -v 'grep' | awk '{ printf $2 }')
while true;
do
#sleep 1 | you can put a sleep in here to minimize the load

test=`ps x | grep 'mpg123 /tmp/mycroft' | grep -v 'grep' | wc -l`;
expr $test + 0

if [ $test -gt 0 ] ; then

testme=`ps x | grep $ani1| grep -v 'grep' | wc -l`
expr $testme + 0
if [ $testme -gt 0 ] ; then

echo "0" > /dev/null
else
exitinterface
switchinterface
catchwords
kill -9 $PQ
pqiv -i -l -c $ani1 &
PQ=$!

fi
else
night=0
night=`ps x | grep $ani2 | wc -l`;
expr $night + 1
if [ $night -gt 1 ] ; then 
echo 0 > /dev/null
else
exitinterface
switchinterface
catchwords
night=0
kill -9 $PQ
pqiv -i -l -c $ani2 &
PQ=$!
fi
fi
done
kill -9 $processIDA
}

              

switchinterface() {

command=`tail -1 /var/log/mycroft/voice.log | grep "show commands" | wc -l`
if [ $command -eq 1 ] ; then
pkill -f mpg123
((command+=1))
echo "COMMANDS SHOWED" >> /var/log/mycroft/voices.log

zenity --info --width 500 --text="
========= MyCroft Interface Linux Commands ==========

say: ''exit interface'' - will go back to the main menu
say: ''switch to jarvis small'' - will switch to the J.A.R.V.I.S windowed theme
say: ''switch to jarvis full'' - will switch to the J.A.R.V.I.S fullscreen theme
say: ''switch to star trek''  - will switch to the STAR TREK theme
say: ''switch to nightrider'' - will switch to the nightrider theme
say: ''show commands'' - will show these commands

"
fi

mycroft=`tail -1 /var/log/mycroft/voice.log | grep "switch to star trek" | wc -l`
if [ $mycroft -gt 0 ] ; then
startrek=1
jarvismall=0
jarvisfull=0
kitt=0
pkill -9  mpg123
pkill -9  feh 
pkill -9  pqiv
feh -F images/startrek_bgnew.jpg &
ani1=images/tenor.gif
ani2=images/stlogo.gif 
killall mpg123
mycroft=`tail -6 /var/log/mycroft/voice.log | grep "hey jarvis" | wc -l`
expr mycroft
if [ $mycroft -gt 0 ];then
  

mycroft="Say [ Hey Jarvis ] to activate"
else
mycroft="Computer is listing..."
fi
date="CREW MEMBER: `whoami`";
convert -font helvetica -pointsize 34 -fill white -draw "text 1245,190 '$date' " startrek_bg.jpg startrek_bgnew.jpg
convert -font helvetica -pointsize 16 -fill white -draw "text 840,690 '$mycroft' " startrek_bgnew.jpg startrek_bgnew.jpg   
fi
# detect jarvis_small
mycroft=`tail -1 /var/log/mycroft/voice.log | grep "switch to jarvis small" | wc -l`
if [ $mycroft -gt 0 ] ; then
jarvissmall=1
jarvisfull=0
startrek=0
kitt=0
pkill -9  mpg123
pkill -9  feh 
pkill -9  pqiv
ani1=images/jarvis2_talk_small.gif
ani2=images/jarvis2_small.gif

pqiv -c -l -i images/jarvis_small.png &
fi
#detect jarvis_full
mycroft=`tail -1 /var/log/mycroft/voice.log | grep "switch to jarvis full" | wc -l`
if [ $mycroft -gt 0 ] ; then
jarvisfull=1
jarvissmall=0
startrek=0
kitt=0
pkill -9  mpg123
pkill -9  feh 
pkill -9  pqiv
ani1=images/jarvis2_talk_full.gif
ani2=images/jarvis2_full.gif
feh -F --zoom fill images/jarvis_full.jpg &
fi
#detect nightrifer
mycroft=`tail -1 /var/log/mycroft/voice.log | grep "switch to night rider" | wc -l`
if [ $mycroft -gt 0 ] ; then
kit=1
jarvis=0
startrek=0
pkill -9  mpg123
pkill -9  feh 
pkill -9  pqiv
feh -F images/black.gif &  
ani1=images/fast.gif
ani2=images/night.gif
fi
}
exitinterface() {
mycroft=`tail -1 /var/log/mycroft/voice.log | grep "exit interface" | wc -l`
expr $mycroft
if [ $mycroft -gt 0 ];then

pkill -f mpg123
pkill -f  pqiv
pkill -f  feh
#kill again the mpeg output
pkill -f  mpg123
clear
menu
pkill -f mpg123
pkill -f  pqiv
pkill -f  feh
fi
}

menu() {
choice=0
echo STARTING >> /var/log/mycroft/voice.log
clear
choice=`zenity --list --radiolist --column Selection --column="Name of Theme" JFULL "J.A.R.V.I.S FULLSCREEN" JWIN "J.A.R.V.I.S WINDOWED" STAR-TREK "STAR-TREK" K.I.T.T "K.I.T.T" --width=500 --height=450 --text "

          MyCroft Front Interface for Linux

Note: This program is nothing special. It is a scripts
which i wrote fast and ugly. There is lots of room for
improvements. I encourage everybody to edit and enhance
it. 

Also: It might be strange scaled on some devices.



Please make a choice"`
if [ "$choice" = "J.A.R.V.I.S FULLSCREEN" ] ;then
                echo "Starting J.A.R.V.I.S interface.."
jarvisfull
elif [ "$choice" = "J.A.R.V.I.S WINDOWED" ] ;then
                echo "Starting J.A.R.V.I.S WINDOWED interface.."
jarvissmall
#STARTREK
elif [  "$choice" = "STAR-TREK" ] ;then
               echo "Starting STAR-TREK interface.."
ani1=tenor.gif
ani2=stlogo.gif #LCARS.gif
startrek
#KITT
elif [ "$choice" = "K.I.T.T" ] ;then
                         echo "Starting K.I.T.T interface.."
ani1=fast.gif
ani2=night.gif
kitt 
else
pkill -f  feh
pkill -f  pqiv
pkill -f mpg123
processIDB=$(ps -ef | grep 'mycroft_visal.sh' | grep -v 'grep' | awk '{ printf $2 }')
kill -9 $processIDB
clear
zenity --info --width 400 --title "MyCroft Interface LInux" --text="

Thank you for trying!

Yes it is one big mess still, working
to improve all.

Thank you for trying. Please if 
you have comments or remarks please do.

"
exit 0
menu
fi
pkill -f  feh
pkill -f  pqiv
pkill -f mpg123
processIDB=$(ps -ef | grep 'mycroft_visal.sh' | grep -v 'grep' | awk '{ printf $2 }')
kill -9 $processIDB
}
# end of routines
# main menu
clear
zenity --question --text "Do you want to display spoken words enabled? (y/n)" --no-wrap --ok-label "Yes" --cancel-label "No";
#read -p "Do you want to display spoken words enabled? (y/n): " notify
notify=$?
case $notify in
        0)
        notify=1;
                ;;
	*)
	notify=0
		;;
esac
menu
kill -9 $processIDA

pkill -f feh
pkill -f pqiv
pkill -f mpg123
processIDB=$(ps -ef | grep 'mycroft_visal.sh' | grep -v 'grep' | awk '{ printf $2 }')
kill -9 $processIDB
clear
exit 0

