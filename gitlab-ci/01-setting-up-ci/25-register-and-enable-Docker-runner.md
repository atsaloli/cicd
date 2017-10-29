# Register a Docker runner

Run `sudo gitlab-runner register` with:
- `Docker runner` for the desription;
- `docker` for the tag;
- `false` for running untagged builds;
- `false` for locking Runner to current project;
- `docker` for the executor;
- `alpine` for the default docker image (it's lightweight).

# [[Next]](26-test-docker-runner.md) [[Up]](README.md)
