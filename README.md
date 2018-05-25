# dshield-led
## Realtime LED alerts for DShield Raspberry Pi Sensor on incoming telnet, SSH or HTTP connections.
## Based off code/work of https://github.com/dstinebaugh/pihole-led

dshield-led.sh will parse /var/log/dshield.log for the strings "DPT=23", "DPT=22" and "DPT=80" and flash a Red, Yellow or Green LED respectively.

*Requires ([wiringPi](http://wiringpi.com/)) to be installed*

Original dstinebaugh/pihole-led project included nearly everything you see here (the base script and the startup script); I just changed the log file that is parses, and added two more LEDs -- because who doesn't like blinky lights?

Original author also included a startup script to launch his pihole-led.sh script on boot.  I have not modified it, and included it here. 
From the author:

"Just edit the values in the Setting block and include it's location to your /etc/rc.local file.
The startup script will launch a new screen session named "blink" so the screen package is also required to be installed. (It's in your repos most likely)" 

I removed the original attribution URL since it was no longer active.  Attribution and more info: dstinebaugh/pihole-led

I'm not going to re-invent the wheel; here's an excellent tutorial for wiring this all up
http://raspberrypi.powersbrewery.com/project-5-traffic-light/
NOTE: there are really cool Red, Yellow, Green "traffic light" hats with LEDs, resistors and pins for $1.50-$5 that would simplify this for anyone that prefers are more refined look.
https://shop.pimoroni.com/products/pistop-traffic-light-add-on-for-raspberry-pi
http://www.icstation.com/traffic-light-display-module-green-yellow-light-arduino-raspberry-p-13216.html


## Todos
- script seemed to exit after about 30 min to 1 hour several times the other day, but hasn't happened since.  Was thinking related to cronjob upload of dshield.log files.  Need to investigate further
- create a parts list/schematic; 
- create installation instructions (for wiringpi, git clone of repo, etc.)
- currently, the script is parsing /var/log/dshield.log file for incoming ports that match 22, 23 and 80.  I eventually want to parse the cowrie and web honeypot logs/data to blink and LED when incoming connections are detected
- add a momentary switch to breadboard to shutdown pi
- buy Daniel Stinebaugh a drink if I ever run into him

