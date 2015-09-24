Docker image for vdr based on vdr4arch

Configure it via the volumes mounted on your host

Start it by running:
docker run -d --privileged --name=vdr4arch -v /vdretc/:/etc/vdr -v /vdrconf/conf/:/var/lib/vdr -v /records/:/srv/vdr/video -p 2004:2004 -p 6419:6419 -p 8002:8002 -p 8008:8008 -v /etc/localtime:/etc/localtime:ro chriszero/vdr4arch
