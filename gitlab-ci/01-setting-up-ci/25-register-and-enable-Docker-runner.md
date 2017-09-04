# Register and enable a Docker runner

## Register a Docker runner

Run `sudo gitlab-ci-multi-runner register` using  `docker` for the executor;
just add `--docker-image alpine` to specify default docker image
(we use `alpine` as the default docker image because it is lightweight).

## Enable this runner

Enable this runner for our "www" project.
