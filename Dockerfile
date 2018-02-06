FROM debian:stretch
MAINTAINER OSDN, Corp. <info@osdn.jp>

ENV FILES=files
ENV PYLUCENE_VERSION=4.10.1-1
ENV PYLUCENE_TARBALL=$FILES/pylucene_4.10.1+dfsg.orig.tar.gz
ENV PYLUCENE_PATCH=$FILES/pylucene_4.10.1+dfsg-2.debian.tar.xz

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y xz-utils
RUN apt-get install -y debhelper dh-python jcc default-jdk ant python-setuptools python-all-dev antlr3 liblucene4.10-java libasm-java
RUN apt-get install -y devscripts

COPY $PYLUCENE_TARBALL /root/
RUN cd /root/ && tar xvzf $PYLUCENE_TARBALL

COPY  $PYLUCENE_PATCH /root/
RUN cd /root/pylucene-$PYLUCENE_VERSION && tar xvJf /root/$PYLUCENE_PATCH

COPY $FILES/enable_kuromoji.patch /root/pylucene-$PYLUCENE_VERSION/debian/patches/
RUN echo "enable_kuromoji.patch" >> /root/pylucene-$PYLUCENE_VERSION/debian/patches/series

COPY $FILES/control.osdn /root/pylucene-$PYLUCENE_VERSION/debian/control
COPY $FILES/changelog.osdn /root/pylucene-$PYLUCENE_VERSION/debian/changelog

COPY $FILES/entrypoint.sh /
RUN chmod 755 /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]

