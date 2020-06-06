#!/usr/bin/env bash
# Upload to server
jekyll clean
JEKYLL_ENV=production jekyll build
scp -r _site/* jsvps:~/websites/josef-adamcik.cz
