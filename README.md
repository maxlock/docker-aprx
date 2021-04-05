# Run APRX in Docker

To build:
    docker build --tag aprx:latest .

To run:
    docker container run -it --rm --device /dev/snd --device /dev/hidraw0 --volume /mnt/docker_aprx:/aprx aprx:latest
