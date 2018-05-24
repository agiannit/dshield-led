# dshield-led
## LED alerts for DShield honeypot on incoming Telnet, SSH or HTTP connections
## Based off code of dstinebaugh/pihole-led
## WIP -- just figuring things out, which logs to process, etc.

dshield-led.sh will parse TBD for the string "TBD" and if found it will set gpio header pin 11 (wiringpi pin 0) to high (on) briefly then turn it back off making it blink once for each entry found in near realtime.

*Requires ([wiringPi](http://wiringpi.com/)) to be installed*

Comment out the echo line 25 in the loop if you don't want textual updates to the terminal.

I have now also included a startup script to launch the pihole-led.sh script on boot. Just edit the values in the Setting block and include it's location to your /etc/rc.local file.

The startup script will launch a new screen session named "blink" so the screen package is also required to be installed. (It's in your repos most likely) 

Link no longer works, but leaving this in here to credit original author
Attribution and more info: http://www.stinebaugh.info/get-led-alerts-for-each-blocked-ad-using-pi-hole/
