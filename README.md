[hub]: https://hub.docker.com/r/spritsail/tautulli
[git]: https://github.com/spritsail/tautulli
[drone]: https://drone.spritsail.io/spritsail/tautulli
[mbdg]: https://microbadger.com/images/spritsail/tautulli

# [spritsail/tautulli][hub]
[![Layers](https://images.microbadger.com/badges/image/spritsail/tautulli.svg)][mbdg]
[![Latest Version](https://images.microbadger.com/badges/version/spritsail/tautulli.svg)][hub]
[![Git Commit](https://images.microbadger.com/badges/commit/spritsail/tautulli.svg)][git]
[![Docker Stars](https://img.shields.io/docker/stars/spritsail/tautulli.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/spritsail/tautulli.svg)][hub]
[![Build Status](https://drone.spritsail.io/api/badges/spritsail/tautulli/status.svg)][drone]


Dockerfile for running the Plex monitoring and statistics tool Tautulli. It expects a  volume to store data mapped to /config in the container. Enjoy!
This Dockerfile uses a user with UID 905. Make sure this user has write access to the `/config` folder.

*Note - if your using this with our other media Dockerfiles, note the port change to avoid conflict with Headphones!*

## Example run command
```bash
docker run -d --restart=always --name tautulli -v /volumes/tautulli:/config -p 8182:8181 spritsail/tautulli
```
