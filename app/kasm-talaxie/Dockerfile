ARG BASE_TAG="1.19.0"
ARG BASE_IMAGE="core-ubuntu-jammy"
FROM kasmweb/${BASE_IMAGE}:${BASE_TAG}

USER root

ARG TALAXIE_EXE=TOS_DI
ARG TALAXIE_VERSION=20261020_1824-V8.9.0SNAPSHOT

ENV HOME=/home/kasm-default-profile \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=$STARTUPDIR/install

WORKDIR $HOME

######### Customize Container Here ###########

ENV TALAXIE_EXE=$TALAXIE_EXE \
    JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64 \
    SWT_GTK3=1 \
    GDK_BACKEND=x11 \
    WEBKIT_DISABLE_COMPOSITING_MODE=1 \
    GTK_OVERLAY_SCROLLING=0

ADD --unpack=true $TALAXIE_EXE-$TALAXIE_VERSION-linux.gtk.x86_64.tar.gz /opt/talaxie
COPY --chmod=755 custom_startup.sh $STARTUPDIR/custom_startup.sh

RUN apt-get update && apt-get install -y --no-install-recommends \
        openjdk-21-jdk \
        libgtk-3-0  \
        libwebkit2gtk-4.0-37 \
        libxtst6 \
        fonts-dejavu  \
        fonts-liberation \
    && chmod +x /opt/talaxie/$TALAXIE_EXE \
    && chown 1000:0 $STARTUPDIR/custom_startup.sh \
    && INI=/opt/talaxie/$TALAXIE_EXE.ini \
    && sed -i 's/\r$//' "$INI" \
    && sed -i '/^-vm$/,+1d' "$INI" \
    && sed -i '/^-Xm[sx]/d' "$INI" \
    && sed -i '/^-vmargs/i -vm\n/usr/lib/jvm/java-21-openjdk-amd64/bin/java' "$INI" \
    && printf '\n-Xms4g\n-Xmx8g\n-Dswt.autoScale=100\n' >> "$INI" \
    && chown -R 1000:0 /opt/talaxie \
    && rm -rf /var/lib/apt/lists/*

######### End Customizations ###########

RUN chown 1000:0 $HOME

ENV HOME=/home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000