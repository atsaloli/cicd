## Install Docker

Install Docker so that our GitLab CI Runner service can run jobs in Docker containers.


```shell_session
# Install Docker
curl -sSL https://get.docker.com/ | sudo sh


# confirm Docker works
sudo docker run alpine /bin/echo 'Hello world'
```

Example of successful test:

```shell_session
$ sudo docker run alpine /bin/echo 'Hello world'
Unable to find image 'alpine:latest' locally
latest: Pulling from library/alpine
0a8490d0dfd3: Pull complete
Digest: sha256:dfbd4a3a8ebca874ebd2474f044a0b33600d4523d03b0df76e5c5986cb02d7e8
Status: Downloaded newer image for alpine:latest
Hello world
$
```
