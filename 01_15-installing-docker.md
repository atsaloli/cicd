## Install Docker

Let's install Docker, to run repeatable tests in reproducible environments.

Do this on the Runner Server, which, for expediency in this tutorial,
is the same as the GitLab Server. (For production use, you should have
dedicated Runner Servers and a dedicated GitLab Server.)

Install and test Docker:

```console
curl -sSL https://get.docker.com/ | sudo sh

sudo docker run alpine /bin/echo 'Hello world'
```

Example successful test:

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

# [[Next]](01_20-installing-gitlab-ci.md) [[Up]](README.md)
