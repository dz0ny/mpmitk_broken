FROM ubuntu:trusty

# Injecting universe repos closest to build server
RUN rm /etc/apt/sources.list; \
	echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse' >> /etc/apt/sources.list; \
	echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse' >> /etc/apt/sources.list; \
	echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse' >> /etc/apt/sources.list; \
	echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse' >> /etc/apt/sources.list; \
	apt-get -y --force-yes update; \
	apt-get -y --force-yes upgrade;

RUN apt-get -qq -y --force-yes install software-properties-common python-software-properties
RUN add-apt-repository ppa:ondrej/php5 -y
RUN apt-get update -qq -y --force-yes
RUN apt-get -qq -y --force-yes install apache2 php5 apache2-mpm-itk