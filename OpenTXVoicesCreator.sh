#!/bin/bash

LANG="it"
mkdir -p SOUNDS/$LANG/SYSTEM

OLDIFS=$IFS
IFS=";"
while read path file voice
 do
	filename=$(echo $file | cut -f 1 -d '.')
	gtts-cli.py $voice -l "$LANG" -o $path/$filename.mp3
	echo "path: $path || file: $file || voice: $voice"
 done < voices.csv
 IFS=$OLDIFS


for i in SOUNDS/$LANG/*.mp3; do ffmpeg -y -i "$i" -acodec pcm_s16le -ac 1 -ar 32000 "${i%.mp3}.wav" ; done
for i in SOUNDS/$LANG/SYSTEM/*.mp3; do ffmpeg -y -i "$i" -acodec pcm_s16le -ac 1 -ar 32000 "${i%.mp3}.wav" ; done

rm SOUNDS/$LANG/*.mp3
rm SOUNDS/$LANG/SYSTEM/*.mp3
