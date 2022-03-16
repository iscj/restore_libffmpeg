#!/bin/bash
DIR_LIB="/snap/chromium-ffmpeg/24/chromium-ffmpeg-104707/chromium-ffmpeg"
DIR_OPERA="/usr/lib/x86_64-linux-gnu/opera"
FILE_FFMPEG_CONFIG="ffmpeg_preload_config.json"

if [ -d "$DIR_LIB" ]; then
	echo "Coping file"
	sudo cp "$DIR_LIB/libffmpeg.so" $DIR_OPERA
	echo "Backup File ${FILE_FFMPEG_CONFIG}"
	sudo cp "$DIR_OPERA/resources/$FILE_FFMPEG_CONFIG" "$DIR_OPERA/resources/backup_$FILE_FFMPEG_CONFIG"
	echo "Update file"
	echo '[
	  "/usr/lib/x86_64-linux-gnu/opera/libffmpeg.so",
	  "../../../../chromium-ffmpeg/libffmpeg.so",
	  "/usr/lib/chromium-browser/libffmpeg.so",
	  "/usr/lib/chromium-browser/libs/libffmpeg.so"
	]' | sudo tee "$DIR_OPERA/resources/$FILE_FFMPEG_CONFIG" >/dev/null  
	#> "$DIR_OPERA/resources/$FILE_FFMPEG_CONFIG"
else
	echo "${DIR_LIB} not found. Can not continue"
fi
