
FROM alpine:latest

WORKDIR /app

COPY . .

RUN apk update
RUN apk add --no-cache bash
RUN apk add --no-cache ffmpeg
RUN apk add --no-cache yt-dlp
RUN mkdir -p /media

CMD ["./docker_script.sh"]



