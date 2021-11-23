# Common commands

From [source](https://www.mankier.com/1/docker#Examples_(TL;DR)).

Command | Description
--- | ---
`docker ps` | List currently running docker containers: 
`docker ps -a` | List all docker containers (running and stopped)
`docker run --rm IMAGE` | Start a container from an image, with a random name
`docker run  --rm --name CONTAINER_NAME IMAGE` |  Start a container from an image, with a custom name
`docker run --rm -p 80:8080 IMAGE` | Expose and publish ports of a server
`docker start|stop CONTAINER_NAME` | Start or stop an existing container
`docker pull IMAGE` | Pull an image from a docker registry
`docker exec -it CONTAINER_NAME bash` | Open a shell inside of an already running container
`docker rm CONTAINER_NAME` |  Remove a stopped container: 
`docker logs -f CONTAINER_NAME` |  Fetch and follow the logs of a container
