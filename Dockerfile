FROM ubuntu:20.04
LABEL maintainer="Karim DRIDI <karim.dridi@gmail.com>"

RUN export DEBIAN_FRONTEND=noninteractive && \
    rm /etc/dpkg/dpkg.cfg.d/excludes && \
    apt update && \
    apt reinstall -y $(apt list --installed 2>/dev/null | grep 'installed' | cut -d / -f 1) && \
    apt install -y apt-utils && \
    apt upgrade -y && \
    apt install -y apt-file man-db hollywood && \
    apt-file update && \
    yes | unminimize && \
    mandb

CMD [ "hollywood" ]