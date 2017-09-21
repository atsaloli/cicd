# Register a Docker runner

Run `sudo gitlab-runner register` using `docker` for the executor;
use `alpine` as the default docker image because it is lightweight.
If you're doing the non-interactive registration, you can specify
the image with `--docker-image alpine`.
