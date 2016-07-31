# docker-plexpy
Dockerfile for running the Plex monitoring and statistics tool PlexPy. It expects a  volume to store data mapped to /config in the container. Enjoy!  
This dockerfile uses a user with uid 426. Make sure this user has write access to the /config/plexpy folder.

*Note - if your using this with my other media Dockerfiles, note the port change to avoid conflict with Headphones!*
##Example run command
`docker run -d --restart=always --name PlexPy --volumes-from Data -p 8182:8181 adamant/plexpy`
