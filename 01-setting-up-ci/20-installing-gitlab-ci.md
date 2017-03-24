# Installing GitLab CI Runner

Reference: [GitLab Runner installation documentation](https://docs.gitlab.com/runner/install/linux-repository.html)


## Install Docker
First, [install Docker](21-installing-docker.md) so our GitLab CI Runner can run repeatable tests in reproducible environments.


## Add GitLab CI repo
```
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash
```

## Install GitLab Runner
```
sudo apt-get install -y gitlab-ci-multi-runner
```

## Add gitlab-runner to the docker group
```
sudo usermod -aG docker gitlab-runner
```

## Confirm GitLab Runner service is active (running)
```
sudo service gitlab-runner status
```
