# Installing GitLab CI Runner

Reference: [GitLab Runner installation documentation](https://docs.gitlab.com/runner/install/linux-repository.html)


## Add GitLab CI repo
```
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash
```

## Install GitLab Runner
```
sudo apt-get install -y gitlab-ci-multi-runner
```

## Add gitlab-runner to the docker group to allow the non-root user gitlab-runner to use Docker

```
sudo usermod -aG docker gitlab-runner
```

## Confirm GitLab Runner service is active (running)
```
sudo service gitlab-runner status
```
Notice that it says "active (running)" in the Active status line

Notice also that GitLab Runner has its own config file, in `/etc/gitlab-runner/config.toml`

TOML is [Tom's Obvious, Minimal Language](https://github.com/toml-lang/toml). YAML is simpler
and more readable than XML; TOML is even simpler than YAML.
