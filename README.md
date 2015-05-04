# 

based on https://github.com/aerospike/aerospike-server.docker

# Using this Image

```
sudo docker build -t gitinsky/openwrt-1209-builder https://github.com/gitinsky/openwrt-1209-builder-docker.git

sudo docker run \
  -v ~/openwrt/1209/config:/openwrt/config \
  -v ~/openwrt/1209/result:/openwrt/result \
  -t -i gitinsky/openwrt-1209-builder
```
