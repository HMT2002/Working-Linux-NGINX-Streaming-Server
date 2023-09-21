ffmpeg -stream_loop -1 -y -re -i "$1.mkv" -vcodec copy -loop -1 -c:a aac -b:a 160k -ar 44100 -strict -2 -f flv "rtmp:$2/live/$1_mkv"
