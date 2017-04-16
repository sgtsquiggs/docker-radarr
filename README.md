[![](https://images.microbadger.com/badges/image/sgtsquiggs/radarr.svg)](https://microbadger.com/images/sgtsquiggs/radarr)

# radarr

This image is derived from [sgtsquiggs/alpine.mono](https://hub.docker.com/r/sgtsquiggs/alpine.mono/).

[Radarr](https://github.com/Radarr/Radarr) is a fork of Sonarr to work with movies à la Couchpotato.

## Usage
```
docker run \
    --name=radarr \
    -v <path to data>:/config \
    -v <path to downloads>:/downloads \
    -v <path to media>:/movies \
    -e PGID=<gid> -e PUID=<uid> \
    -p 8989:8989 \
    sgtsquiggs/radarr
```

## Parameters
* `-p 8989:8989` external port 8989 mapping to internal port 8989
* `-v <path>:/config` where configuation files are stored.
* `-v <path>:/downloads` where download clients save files.
* `-v <path>:/movies` where media is sorted and moved to.
* `-e PGID=<gid>` for Group ID (see below)
* `-e PUID=<uid>` for User ID (see below)

## User and Group ID
Set these to match the user/group ID of shared data volumes. Files written to these volumes will match the
provided uid/gid.

## Acknowledgements

* [linuxserver/radarr](https://github.com/linuxserver/docker-radarr)
