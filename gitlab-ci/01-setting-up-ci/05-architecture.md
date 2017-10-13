# Architecture: GitLab Server + Runner Server

**GitLab Server** is a web application with an API that stores its state in a database. This is where your git repos live.

**Runner Server** is an application which processes CI/CD jobs. It can be deployed separately and works with GitLab through an API.

In order to run CI/CD jobs (such as tests), you need at least one GitLab Server and one Runner Server. You _can_ have more than one Runner Server.

![arch diagram](https://about.gitlab.com/images/ci/arch-1.jpg)

# [[Up]](README.md)
