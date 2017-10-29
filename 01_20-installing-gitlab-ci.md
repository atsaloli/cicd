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
### Allowing Runner Server user to use Docker

Add non-root "gitlab-runner" user to the docker group to allow
it to use Docker:

```console 
sudo usermod -aG docker gitlab-runner

```
## Setting up your CI/CD infrastructure
### Locating the config file for Runner Server

Runner Server has its own config file, in `/etc/gitlab-runner/config.toml`

Let's take a look at it.


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

Note: TOML is [Tom's Obvious, Minimal Language](https://github.com/toml-lang/toml). 
Just as YAML is simpler (and more readable) than XML, so is TOML is simpler 
(and more readable) than YAML.

Here is what our settings mean:

| Setting | Description |
|---------|-------------|
| concurrent | Limits how many jobs globally can be run concurrently. The most upper limit of jobs using all defined runners. 0 does not mean unlimited |
| check_interval | defines in seconds how often to check GitLab for a new builds |

We won't look at the [other possible settings](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/configuration/advanced-configuration.md) now.
