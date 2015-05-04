FROM debian:7

RUN apt-get update -y
RUN apt-get install -y \
  git-core build-essential libssl-dev libncurses5-dev unzip subversion mercurial \
  asciidoc bash bc binutils bzip2 fastjar flex git-core g++ gcc util-linux \
  gawk libgtk2.0-dev intltool zlib1g-dev make genisoimage libncurses5-dev \
  libssl-dev patch perl-modules python2.6-dev rsync ruby sdcc unzip wget \
  gettext xsltproc zlib1g-dev 
RUN rm -rvf /var/lib/apt/lists/*
RUN useradd -m -d /compile -s /bin/bash -c 'To run compiler' compile
RUN su compile -c "git clone git://git.openwrt.org/12.09/openwrt.git /compile/openwrt-1209"
RUN cd /compile/openwrt-1209 && su compile -c "./scripts/feeds update -a"
RUN cd /compile/openwrt-1209 && su compile -c "./scripts/feeds install -a"
RUN cd /compile/openwrt-1209 && su compile -c "make defconfig"
RUN cd /compile/openwrt-1209 && su compile -c "make prereq"
#ADD etc/aerospike/aerospike.conf.template /etc/aerospike/aerospike.conf.template

# Mount the Aerospike data directory
#VOLUME ["/storage/data"]

#EXPOSE 3000 3001 3002 3003

# Execute the run script in foreground mode

CMD ["/bin/bash"]

