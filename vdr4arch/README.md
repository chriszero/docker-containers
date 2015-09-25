Docker image for vdr based on vdr4arch

Configure it via the volumes mounted on your host

Start it by running:
docker run -d --privileged --name=vdr4arch --net=host -v /vdretc/:/etc/vdr -v /vdrconf/conf/:/var/lib/vdr -v /records/:/srv/vdr/video -v /etc/localtime:/etc/localtime:ro chriszero/vdr4arch
