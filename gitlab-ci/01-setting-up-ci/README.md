# Infrastructure Setup

## Install "GitLab CE" and "GitLab CI/CD"

GitLab CE (Community Edition, as opposed to Enterprise Edition) provides the GitLab UI and file store, it's the GitLab Server in the below diagram.

The Runner Server has runners which run build/test/deploy jobs.

The Runner Server talks to GitLab Server over the GitLab REST API.

![GitLab Architecture](https://about.gitlab.com/images/ci/arch-1.jpg)

Image credit: https://about.gitlab.com/images/ci/arch-1.jpg

- [Install GitLab CE](10-installing-gitlab-ce.md)
- [Add a project and enable CI for it](12-setting-up-a-project.md)
- [Install Docker](15-installing-docker.md)
- [Install GitLab CI/CD](20-installing-gitlab-ci.md)
- [Install build/test tools](21-install-build-and-test-tools.md)



## Registering, enabling and using runners; reading job logs
- [Register your first runner](22-registering-our-first-runner.md)
- [Enable your first runner](18-enabling-shell-runner.md)
- [Unregister runner](24-unregistering-runners.md)
- [Register and enable Docker runner](25-register-and-enable-Docker-runner.md)
- [Test Docker runner](26-test-docker-runner.md)
- [Use a different container image](27-change-docker-image.md)
- [Runner administration](80-runners-admin.md)
- [Paused runner](84-paused-runner.md)
- [Pause Docker runner and register Shell runner](86-shell-again.md)

## Set up deployment targets: stage and prod
- [Set up "stage" and "prod" web sites](91-set-up-prod-and-stg-web-sites.md)
- [Set up trust relationship to deploy via SSH](92-deploy-using-ssh.md)
- [Set up trust relationships to deploy via Git](93-deploy-via-git.md)
