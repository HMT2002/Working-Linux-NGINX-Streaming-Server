ffmpeg -i "$1" -c:v copy -f hls -hls_playlist_type vod -level 3.0 -start_number 0 -hls_time 10 -hls_list_size 0 "./convert/$2.m3u8"
