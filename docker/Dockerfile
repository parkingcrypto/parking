FROM debian:stretch
LABEL maintainer="Parking Developers <dev@parkcoin.club>"
LABEL description="Dockerised ParkingCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
