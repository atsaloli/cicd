# Install Runner Server


The Runner Server is in the GitLab `gitlab-ci-multi-runner` repository.

Add the repo definition, install Runner Server, and allow the Runner Server to use Docker:


```console
# Add the repo definition
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash

# Install Runner Server
sudo apt-get install -y gitlab-ci-multi-runner

# Add "gitlab-runner" user to the docker group to allow
# the non-root user gitlab-runner to use Docker fully

sudo usermod -aG docker gitlab-runner

```

## Confirm Runner Server is active

The "Active" status should be "active (running") when you check service status:


```console
sudo service gitlab-runner status
```


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

There are [more settings](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/configuration/advanced-configuration.md), which won't look at now.

# [[Next]](21-install-build-and-test-tools.md) [[Up]](README.md)
