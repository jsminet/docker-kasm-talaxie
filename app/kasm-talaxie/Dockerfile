ARG BASE_TAG="1.19.0"
ARG BASE_IMAGE="core-ubuntu-jammy"
FROM kasmweb/${BASE_IMAGE}:${BASE_TAG}

USER root

ARG TALAXIE_EXE=TOS_DI
ARG TALAXIE_VERSION=20261020_1824-V8.9.0SNAPSHOT
ARG XMS=4g
ARG XMX=8g

ENV HOME=/home/kasm-default-profile \
    STARTUPDIR=/dockerstartup

WORKDIR $HOME

######### Customize Container Here ###########

ENV TALAXIE_EXE=$TALAXIE_EXE \
    XMS=$XMS \
    XMX=$XMX \
    JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64 \
    SWT_GTK3=1 \
    GDK_BACKEND=x11 \
    WEBKIT_DISABLE_COMPOSITING_MODE=1 \
    GTK_OVERLAY_SCROLLING=0

ADD --unpack=true $TALAXIE_EXE-$TALAXIE_VERSION-linux.gtk.x86_64.tar.gz /opt/talaxie
COPY --chmod=+x custom_startup.sh $STARTUPDIR/custom_startup.sh

RUN apt-get update && apt-get install -y --no-install-recommends \
        openjdk-21-jdk \
        libgtk-3-0  \
        libwebkit2gtk-4.0-37 \
        libxtst6 \
        fonts-dejavu  \
        fonts-liberation \
    && chmod +x /opt/talaxie/$TALAXIE_EXE \
    && INI=/opt/talaxie/$TALAXIE_EXE.ini \
    && sed -i 's/\r$//' "$INI" \
    && sed -i '/^-vm$/,+1d' "$INI" \
    && sed -i '/^-Xm[sx]/d' "$INI" \
    && sed -i '/^-vmargs/i -vm\n/usr/lib/jvm/java-21-openjdk-amd64/bin/java' "$INI" \
    && printf '\n-Xms'"$XMS"'\n-Xmx'"$XMX"'\n-Dswt.autoScale=100\n' >> "$INI" \
# Update the desktop environment to be optimized for a single application
    && cp $HOME/.config/xfce4/xfconf/single-application-xfce-perchannel-xml/* $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/ \
    && cp /usr/share/backgrounds/bg_kasm.png /usr/share/backgrounds/bg_default.png \
    && apt-get remove -y xfce4-panel \
    && apt-get autoclean \
    && rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

######### End Customizations ###########

RUN chown 1000:0 $HOME

ENV HOME=/home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000