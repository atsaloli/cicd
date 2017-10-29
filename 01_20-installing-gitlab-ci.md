## Setting up your CI/CD infrastructure

### Installing Runner Server

GitLab has a separate repository for Runner Server.

Add the repo definition and install the Runner Server package:


```console
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash

sudo apt-get install -y gitlab-ci-multi-runner
```
---

## Setting up your CI/CD infrastructure
### Confirm Runner Server is up

Check service status:

```console
sudo service gitlab-runner status
```

![runner service is active](img/runner_service_active.png)
---

## Setting up your CI/CD infrastructure
### Configure `docker` group

Add non-root "gitlab-runner" user to "docker" group so it can
use Docker fully:

```console 
sudo usermod -aG docker gitlab-runner

```
---

## Setting up your CI/CD infrastructure
### Locate the config file for Runner Server

Runner Server's config file is `/etc/gitlab-runner/config.toml`.
It is in TOML, [Tom's Obvious, Minimal Language](https://github.com/toml-lang/toml), even easier (for humans) than YAML:

```console
sudo cat /etc/gitlab-runner/config.toml
```

Example:

```shell_session
ubuntu@ip-172-31-24-94:~$ sudo cat /etc/gitlab-runner/config.toml
concurrent = 1
check_interval = 0
ubuntu@ip-172-31-24-94:~$
```

| Setting | Description |
|---------|-------------|
| concurrent | Limits how many jobs globally can be run concurrently. The most upper limit of jobs using all defined runners. 0 does not mean unlimited |
| check_interval | defines in seconds how often to check GitLab for a new builds |

We won't look at the [other possible settings](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/configuration/advanced-configuration.md) now.
