#!/bin/bash
###########
### This dshield-led script is built for the Raspberry Pi wiringPi here:
### http://wiringpi.com/download-and-install/
### Originally built by Daniel Stinebaugh for pihole log's, and modified for DShield Honeypot.
### Uses wiringpi pin=0, pin=1, and pin=2
### Consult http://wiringpi.com/pins for wiringpi pin to GPIO mapping 
### Tested on Raspberry Pi B
### NOTE:  Works great for syslog as well; originally used to show incoming TCP (string "PROTO=TCP"), UDP (string "PROTO=UDP") and other dropped rule triggers; or any other string you can imagine.
###########
### DShield-LED Author:	Anthony Giannitsis
### Original Author:	Daniel Stinebaugh
### Attribution:	dstinebaugh/pihole-led
### Date: 		05/25/2018
### License: 		Copyleft. Enjoy!
###########

# Red; Telnet
pin0=0
# Yellow; SSH
pin1=1
# Green; HTTP 
pin2=2

gpio mode $pin0 out
gpio mode $pin1 out
gpio mode $pin2 out
# Defaults the pin to low when starting
gpio write $pin0 0
gpio write $pin1 0
gpio write $pin2 0

tailf /var/log/dshield.log | while read INPUT
do
   if [[ "$INPUT" == *"DPT=23"* ]]; then
       gpio write $pin0 1
       sleep 0.2
       gpio write $pin0 0
       sleep 0.1
   fi
   if [[ "$INPUT" == *"DPT=22"* ]]; then
       gpio write $pin1 1
       sleep 0.2
       gpio write $pin1 0
       sleep 0.1
   fi
   if [[ "$INPUT" == *"DPT=80"* ]]; then
       gpio write $pin2 1
       sleep 0.2
       gpio write $pin2 0
       sleep 0.1
   fi

done
