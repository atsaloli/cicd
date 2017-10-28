# Install Runner Server

Reference: [GitLab Runner installation documentation](https://docs.gitlab.com/runner/install/linux-repository.html)


## Add repository definition for the Runner Server project

The Runner Server is in the GitLab `gitlab-ci-multi-runner` repository.

Add the repository definition:

```
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash
```

## Install Runner Server
```
sudo apt-get install -y gitlab-ci-multi-runner
```

## Add gitlab-runner to the docker group to allow the non-root user gitlab-runner to use Docker

```
sudo usermod -aG docker gitlab-runner
```

## Confirm gitlab-runner service is up
```
sudo service gitlab-runner status
```
Notice that it says "active (running)" in the Active status line:

![runner service is active](img/runner_service_active.png)

## gitlab-runner config file

Runner Server has its own config file, in `/etc/gitlab-runner/config.toml`

TOML is [Tom's Obvious, Minimal Language](https://github.com/toml-lang/toml). 
Just as YAML is simpler (and more readable) than XML, so is TOML is simpler 
(and more readable) than YAML.

Here it is:

![runner config file](img/gitlab_runner_config_file.png)

| Setting | Description |
|---------|-------------|
| concurrent | Limits how many jobs globally can be run concurrently. The most upper limit of jobs using all defined runners. 0 does not mean unlimited |
| check_interval | defines in seconds how often to check GitLab for a new builds |

There are [more settings](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/configuration/advanced-configuration.md), but that's what we start with.

# [[Next]](21-install-build-and-test-tools.md) [[Up]](README.md)
