FROM sgtsquiggs/alpine.mono:3.4
MAINTAINER sgtsquiggs

# environment settings
ENV XDG_DATA_HOME="/config"
ENV XDG_CONFIG_HOME="/config"

RUN \
# install packages
    apk add --no-cache \
        --virtual=build-dependencies \
        curl \
        tar \
        xz &&\
# install radarr
    mkdir -p \
        /app/radarr &&\
    latest_tag=$(curl -sX GET "https://api.github.com/repos/Radarr/Radarr/releases" \
        | awk '/tag_name/{print $4;exit}' FS='[""]') &&\
    curl -o \
        /tmp/radarr.tar.gz -L \
        https://github.com/Radarr/Radarr/releases/download/${latest_tag}/Radarr.develop.${latest_tag#v}.linux.tar.gz &&\
    tar xf /tmp/radarr.tar.gz \
        -C /app/radarr \
        --strip-components=1 &&\

# cleanup
    apk del build-dependencies &&\
    rm -rf \
        /tmp/*

# add local files
COPY root/ /

# ports and volumes
VOLUME /config /downloads /movies
EXPOSE 7878
