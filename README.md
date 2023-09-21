# Working-Linux-NGINX-Streaming-Server
This build include NGINX RTMP mofule from <a>https://github.com/arut/nginx-rtmp-module</a> and NGINX Upload module from <a>https://github.com/vkholodkov/nginx-upload-module</a>, you can manually add these module depend on the using purpose. Or you can just clone the repo and build the default configurations.

### Installing the Build Tools

    sudo apt update
    sudo apt upgrade
    sudo apt install build-essential git

### Installing Dependencies

    sudo apt install libpcre3-dev libssl-dev zlib1g-dev


### Compiling

Module path is already added in the script, you just need to build it.
Go to nginx directory: `cd nginx`
Install the build:  `sudo make install`
NGINX is ready to start with configuration.

### Validating the Configuration and Starting NGINX

You can either make direct change in /usr/local/nginx/conf/nginx.conf or change in the repo nginx/conf/nginx.conf and then copy it to /usr/local/nginx/conf/ by using `sudo cp /nginx/conf/nginx.conf /usr/local/nginx/conf`

Test Nginx Configuration: `sudo /usr/local/nginx/sbin/nginx -t`

Start Nginx: `sudo /usr/local/nginx/sbin/nginx`

Shutdown Nginx: `sudo /usr/local/nginx/sbin/nginx -s stop`

### Usage

Remember to check your server linux IP address. Here I use the following IPv4 config on Nginx Server.

    Address: 172.30.0.101
    Netmask: 255.255.0.0
    Gateway: 172.30.0.1
    DNS: 8.8.8.8, 8.4.4,8

You need to change your Gateway into the same with a reachable address on your computer. For example: If you want to streaming to your LAN such as Wifi, make sure the Gateway on the server is the same with the Network Default gateway of the network. And other machine can also reach the server through this gateway. AND ESPECIALLY your server address should be something different from the default gateway, just like the above.
And the DNS need to change to the above also.
I use ffmpeg to converting video to stream, so you need to install it on Linux or Windows.
With Windows, download FFMPEG built programs, add the folder to environment path.
With Linux, install with apt

    sudo apt install ffmpeg

.sh file for Linux, .bat for Windows
You also need to change the IP destination in the executeable scripts. The default is 172.30.0.101, you need to change it to your server's address.

Orrrr you can just use the "stream_file_ip_mkv", "stream_file_ip_mp4" scripts, .bat for Windows and .sh for Linux, of course.
mp4 to stream mp4 file, mkv for ... you get what I mean.
Here we use the `test.mkv` video.

    ~ stream_file_ip_mkv test <IP>

The stream will be available at `rtmp:<IP>/live/test_mkv`

<h4>Streaming Linux</h4>

Open terminal and run example file `streamreisenpublic1.sh` with your server's IP address `rtmp:<IP>/live/reisenpublic`

<h4>Streaming Windows</h4>

Open `cmd` and run example file `streamreisenpublic1.bat` with your server's IP address `rtmp:<IP>/live/reisenpublic`

<h4>Accessing</h4>

You can use VLC to access to the RTMP Streaming: `rtmp://<IP>/live/reisenpublic`

or HLS Streaming: `http://172.30.0.101/tmp/hls/reisenpublic.m3u8`

### P/S

Let me know something gone wrong, the script files or the server address sometimes can be messy, some network are reachable but to slow or not allowed, the streaming can be interupt or shutdown.
