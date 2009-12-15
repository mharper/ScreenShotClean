#!/bin/sh

# Remove all screen shot files older than a week from the user's Desktop directory.
/usr/bin/find ~/Desktop -name "Screen*.png" -mtime +7d -delete 