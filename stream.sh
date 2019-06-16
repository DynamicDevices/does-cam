#!/bin/sh

# Target RTMP stream
stream="${AV_STREAM_URL:-rtmp://a.rtmp.youtube.com/live2}"

# Private key for RTMP stream
key="${AV_STREAM_KEY:-5fqf-u2fk-p2pa-fdas}"

# Width, Height
width="${AV_VIDEO_WIDTH:-1280}"
height="${AV_VIDEO_HEIGHT:-720}"

# FPS, Bitrate
fps="${AV_VIDEO_FRAMERATE:-30}"
bitrate="${AV_VIDEO_BITRATE:-2000000}"

# Other Raspivid options
raspivid_options="-vf"

# Do it
#raspivid -o - -t 0 -w $width -h $height -ev 25 -ex nightpreview -fps $fps -b $bitrate $raspivid_options | \
#tee /data/video_$(date +%F_%T).h264 | \
#ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 -f h264 -i - -vcodec copy -c:a aac -ar 44100 -b:a 128k -f flv $stream/$key

raspivid -t 0 -w $width -h $height -ev 25 -ex nightpreview -fps $fps -b $bitrate $raspivid_options -o /data/video_$(date +%F_%T).h264
