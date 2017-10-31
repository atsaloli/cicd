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

Allow non-root user "gitlab-runner" to use Docker:

```console 
sudo usermod -aG docker gitlab-runner

```
---

## Setting up your CI/CD infrastructure
### Locate the config file for Runner Server

Runner Server's config file is `/etc/gitlab-runner/config.toml`.

TOML is [Tom's Obvious, Minimal Language](https://github.com/toml-lang/toml), easier (for humans) than YAML:

```console
sudo cat /etc/gitlab-runner/config.toml
```

Example:

```text
concurrent = 1
check_interval = 0
```

| Setting | Description |
|---------|-------------|
| concurrent | Limits how many jobs globally can be run concurrently. The most upper limit of jobs using all defined runners. 0 does not mean unlimited |
| check_interval | defines in seconds how often to check GitLab for a new builds |

We won't look at the [other possible settings](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/configuration/advanced-configuration.md).
---

## Setting up your CI/CD infrastructure
### Increase concurrency

Edit `/etc/gitlab-runner/config.toml` to increase concurrency to 3.

```console
sudo vim /etc/gitlab-runner/config.toml
```
Runner Server will pick up the change automatically.

Now we can run jobs in parallel (provided there are no dependencies).
