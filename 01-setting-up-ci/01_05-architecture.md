# Architecture: GitLab Server + Runner Server

**GitLab Server** is a web application with an API. This is where your git repos live.

**Runner Server** is an application which processes (runs) CI/CD jobs. It can be deployed separately and works with GitLab through GitLab's API.

To run CI/CD jobs (such as tests), you need a GitLab Server and at least one Runner Server. You _can_ have more than one Runner Server. There is only one GitLab Server.

![arch diagram](https://about.gitlab.com/images/ci/arch-1.jpg)

# [[Next]](01_10-installing-gitlab-server.md) [[Up]](README.md)
