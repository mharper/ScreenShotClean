ScreenShotClean
===============
by Michael Harper
mharper@standalonecode.com

Created 15-Dec-2009

DISCLAIMER
----------
This contraption deletes files, so USE/MODIFY AT YOUR OWN RISK.  You have been warned.


WHY DID I DO THIS?
------------------
My pal [Chris Sexton](http://www.github.com/csexton) wrote this immensely useful utility called ["captured"](http://www.github.com/csexton/captured) which I use constantly.  The down side is that I end up with a PILE of screen shots in my Desktop folder (and thus on my desktop).  I figure these fancy computers are capable of cleaning up after themselves (or Chris, in this case), so I wrote a script that gets fired up by launchd and deletes all screen shots that are a week old every day.


TECHNICAL DETAILS
-----------------
Installs scripts into ~/Library/Application Support/ScreenShotClean and one plist file into ~/Library/LaunchDaemons.


TO INSTALL:
-----------

> $ ./install.sh


TO UNINSTALL:
-------------

> $ ~/Library/Application Support/ScreenShotClean/uninstall.sh


TO MODIFY THE FREQUENCY OF DELETION:
------------------------------------
You can change the frequency at which launchd runs the screenshotclen.sh script by modifying the plist file in ~/Library/LaunchDaemons/com.standalonecode.screenshotclean.plist.

Set the integer value for StartInterval to the number of seconds you want the process to sleep (currently set for 24 hours):

    <key>StartInterval</key>
    <integer>86400</integer>

Of course, you'll have to restart the launchd job for these changes to take effect:

>$ launchctl unload ~/Library/LaunchDaemons/com.standalonecode.screenshotclean.plist

>$ launchctl load ~/Library/LaunchDaemons/com.standalonecode.screenshotclean.plist

TO MODIFY THE AGE OF FILES TO DELETE:
-------------------------------------
The file age defaults to 7 days and is specified in this command in screenshotclean.sh:

> /usr/bin/find ~/Desktop -name "Screen*.png" -mtime +7d -delete 

Take a look at the man page for "find" and you can experiment with different values.


FOR THOSE PAYING ATTENTION
--------------------------
This is actually a nice, simple template for setting up a launchd daemon to "do something" on a periodic basis.