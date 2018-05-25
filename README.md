# dshield-led
## Realtime LED alerts for DShield Honeypot on incoming telnet, SSH or HTTP for Raspberry Pi.
## Based off code/work of dstinebaugh/pihole-led

dshield-led.sh will parse /var/log/dshield.log for the strings "DPT=23", "DPT=22" and "DPT=80" and flash a Red, Yellow or Green LED respectively

*Requires ([wiringPi](http://wiringpi.com/)) to be installed*

Original dstinebaugh/pihole-led project included nearly everything you see here (the base script and the startup script); I just changed the log file that is parges, and added two more LEDs, because who doesn't like blinky lights?

Original author also included a startup script to launch his pihole-led.sh script on boot.  I have not modified it, and included it here. 

From the author:

"Just edit the values in the Setting block and include it's location to your /etc/rc.local file.

The startup script will launch a new screen session named "blink" so the screen package is also required to be installed. (It's in your repos most likely)" 

I removed the original attribution URL since it was no longer active.

Attribution and more info: dstinebaugh/pihole-led

## Todos
- create a bill of materials and schematic
- create installation instructions
- currently, the script is parsing /var/log/dshield.log file for incoming ports that match 22, 23 and 80.  I eventually want to parse the Cowrie and web honeypot logs/data to blink and LED when incoming connections are detected
