FROM ubuntu:xenial

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x70E4618A8167EE24

ARG VERSION=latest

#RUN echo "deb http://downloads.mariadb.com/files/MaxScale/1.4.3/ubuntu xenial main" > /etc/apt/sources.list.d/maxscale.list
RUN echo "deb http://downloads.mariadb.com/enterprise/pvq5-jpe3/mariadb-maxscale/$VERSION/ubuntu xenial main" > /etc/apt/sources.list.d/maxscale.list

RUN apt-get update -q \
	&& apt-get install -y maxscale \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /var/cache/maxscale

CMD ["/usr/bin/maxscale", "--nodaemon", "--syslog=no", "--log=shm"]
