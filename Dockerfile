FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm

# title
ENV TITLE=baidunetdisk

RUN \
  echo "**** add icon ****" && \
  curl -o \
    /kclient/public/icon.png \
    https://nd-static.bdstatic.com/m-static/wp-brand/img/logo-pan.6af52c5e.png && \
  echo "**** download packages ****" && \
  curl -o /tmp/baidunetdisk_linux_2.0.1.deb \
    https://issuepcdn.baidupcs.com/issue/netdisk/LinuxGuanjia/baidunetdisk_linux_2.0.1.deb && \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    /tmp/baidunetdisk_linux_2.0.1.deb \
    libgtk-3-0 && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
    /config/.cache \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000

VOLUME /config
