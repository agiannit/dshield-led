#!/bin/bash
###########
### This dshield-led script is built for the Raspberry Pi wiringPi here:
### http://wiringpi.com/download-and-install/
### Originally built by Daniel Stinebaugh for pihole log's, and modified for DShield Honeypot.
### Uses wiringpi pin=0, pin=1, pin=2, pin=3, pin=4
### Consult http://wiringpi.com/pins for wiringpi pin to GPIO mapping 
### Tested on Raspberry Pi B
### NOTE:  Works great for syslog as well; originally used to show incoming TCP (string "PROTO=TCP"), UDP (string "PROTO=UDP") and other dropped rule triggers; or any other string you can imagine.
###########
### DShield-LED Author:	Anthony Giannitsis
### Original Author:	Daniel Stinebaugh
### Attribution:	dstinebaugh/pihole-led
### Date: 		06/02/2018
### License: 		Copyleft. Enjoy!
###########

# Red;
pin0=0
# Yellow;
pin1=1
# Green;
pin2=2
# Blue;
pin3=3
# White;
pin4=4

gpio mode $pin0 out
gpio mode $pin1 out
gpio mode $pin2 out
gpio mode $pin3 out
gpio mode $pin4 out

# Defaults the pin to low when starting
gpio write $pin0 0
gpio write $pin1 0
gpio write $pin2 0
gpio write $pin3 0
gpio write $pin4 0

tailf /var/log/dshield.log | while read INPUT
do
##  Telnet
   if [[ "$INPUT" == *"DPT=23"* ]]; then
       gpio write $pin0 1
       sleep 0.3
       gpio write $pin0 0
       sleep 0.1
   fi
##  SSH
   if [[ "$INPUT" == *"DPT=22"* ]]; then
       gpio write $pin1 1
       sleep 0.3
       gpio write $pin1 0
       sleep 0.1
   fi
##  HTTP
   if [[ "$INPUT" == *"DPT=80"* ]]; then
       gpio write $pin2 1
       sleep 0.3
       gpio write $pin2 0
       sleep 0.1
   fi

##  HTTPS
   if [[ "$INPUT" == *"DPT=443"* ]]; then
       gpio write $pin2 1
       sleep 0.3
       gpio write $pin2 0
       sleep 0.1
   fi

##  FTP
   if [[ "$INPUT" == *"DPT=21"* ]]; then
       gpio write $pin3 1
       sleep 0.3
       gpio write $pin3 0
       sleep 0.1
   fi

##  UDP
   if [[ "$INPUT" == *"PROTO=UDP"* ]]; then
       gpio write $pin4 1
       sleep 0.3
       gpio write $pin4 0
       sleep 0.1
   fi

done
