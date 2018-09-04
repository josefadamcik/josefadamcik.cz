#!/usr/bin/env bash
#Builds resume to pdf. Uses https://github.com/josefadamcik/markdown-resume with slightly modified custom template.
../markdown-resume/bin/md2resume pdf -t josef -o resume _includes/resumecontent.md .
../markdown-resume/bin/md2resume html -t josef -o resume _includes/resumecontent.md .
