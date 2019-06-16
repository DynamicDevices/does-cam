#!/bin/sh

# Target RTMP stream
stream=rtmp://a.rtmp.youtube.com/live2

# Private key for RTMP stream
key=5fqf-u2fk-p2pa-fdas

# Width, Height
width=1280
height=720

# FPS, Bitrate
fps=25
bitrate=6000000

# Other Raspivid options
raspivid_options=-vf

# Do it
raspivid -o - -t 0 -w $width -h $height -ev 25 -ex nightpreview -fps $fps -b $bitrate $raspivid_options | ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 -f h264 -i - -vcodec copy -c:a aac -ar 44100 -b:a 128k -f flv $stream/$key
