#
#
#    (C) 2015 Bertuolo Luca <info@e-tips.it>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
#



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
