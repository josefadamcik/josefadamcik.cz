#!/usr/bin/env bash
#Builds resume to pdf. Uses https://github.com/josefadamcik/markdown-resume with slightly modified custom template.
./markdown-resume/bin/md2resume pdf --pdfargs="--dpi 300 --page-size A4 -T 1in -B 1in -L 1in -R 1in --print-media-type" -k -t josef -o resume _includes/resumecontent.md .
./markdown-resume/bin/md2resume html -t josef -o resume _includes/resumecontent.md .
