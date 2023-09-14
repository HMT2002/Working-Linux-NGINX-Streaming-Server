ffmpeg -stream_loop -1 -y -re -i ff.mp4 -vcodec copy -loop -1 -c:a aac -b:a 160k -ar 44100 -strict -2 -f flv rtmp:172.30.0.101/live/ffpublic
