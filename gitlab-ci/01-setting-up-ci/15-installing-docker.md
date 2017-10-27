## Install Docker

Let's install Docker, so our runners can run repeatable tests in reproducible environments.

Do this on the Runner Server, which, in our case, is the same as the GitLab Server.

```console
# Install Docker
curl -sSL https://get.docker.com/ | sudo sh

# confirm Docker works
sudo docker run alpine /bin/echo 'Hello world'
```


Example output of the Docker test:

```shell_session
ubuntu@1ddb8d03-6597-48bd-a001-9c4f5a99dd6d:~$ sudo docker run alpine /bin/echo 'Hello world'
Unable to find image 'alpine:latest' locally
latest: Pulling from library/alpine
88286f41530e: Pull complete
Digest: sha256:f006ecbb824d87947d0b51ab8488634bf69fe4094959d935c0c103f4820a417d
Status: Downloaded newer image for alpine:latest
Hello world
ubuntu@1ddb8d03-6597-48bd-a001-9c4f5a99dd6d:~$
```

# [[Next]](20-installing-gitlab-ci.md) [[Up]](README.md)
