FROM debian:7

RUN apt-get update -y
RUN apt-get install -y \
  git-core build-essential libssl-dev libncurses5-dev unzip subversion mercurial
  asciidoc bash bc binutils bzip2 fastjar flex git-core g++ gcc util-linux \
  gawk libgtk2.0-dev intltool jikespg zlib1g-dev make genisoimage libncurses5-dev \
  libssl-dev patch perl-modules python2.6-dev rsync ruby sdcc unzip wget \
  gettext xsltproc zlib1g-dev 
RUN /var/lib/apt/lists/*
RUN git clone git://git.openwrt.org/12.09/openwrt.git /openwrt-1209
RUN cd /openwrt-1209 && ./scripts/feeds update -a
RUN cd /openwrt-1209 && ./scripts/feeds install -a
RUN cd /openwrt-1209 && make defconfig
RUN cd /openwrt-1209 && make prereq
#ADD etc/aerospike/aerospike.conf.template /etc/aerospike/aerospike.conf.template

# Mount the Aerospike data directory
#VOLUME ["/storage/data"]

#EXPOSE 3000 3001 3002 3003

# Execute the run script in foreground mode

CMD ["/bin/bash"]

