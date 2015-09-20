Docker image for oscam

Start it by running:
docker run -d --name=oscam --device=/dev/ttyUSB0:/dev/ttyUSB0 -v /path/to/host/config/oscam/:/config -p 8888:8888 -v /etc/localtime:/etc/localtime:ro chriszero/oscam
