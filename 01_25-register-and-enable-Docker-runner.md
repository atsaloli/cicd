## Setting up your CI/CD infrastructure

### Registering a Docker runner

```console
sudo gitlab-runner register
```

Use:
- `Docker runner` for the desription
- `docker` for the tag
- `false` for running untagged builds
- `false` for locking Runner to current project
- `docker` for the executor
- `alpine` for the default docker image (Alpine is a lightweight image)
