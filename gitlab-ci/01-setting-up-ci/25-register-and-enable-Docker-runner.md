# Register a Docker runner

Run `sudo gitlab-runner register` with "Docker runner" for the desription;
`docker` for the executor;
and `alpine` for the default docker image (it's lightweight).

During non-interactive registration, specify the image with `--docker-image alpine`.

# [[Next]](26-test-docker-runner.md) [[Up]](README.md)
