## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Now, instead of _pushing_ code to the system, let's build
a distributed system; where runners push successfully
tested changes to special Git branches; and environment
_pulls_ changes from its respective Git.

Let's set up the deploy-to-prod job to push to the "prod"
branch in Git; and let's set up the Prod environment to pull from the
"prod" branch (while development continues on the "master" branch).

---
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

First, make sure `gitlab-runner` SSH key is allowed to write to the GitLab repo.

(What is the key called? How to set this up?)

---
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Add GitLab's host key to the environments' `known_hosts` database so that we can run `git` commands under cron (non-interactive) without dealing with "I haven't seen this host before. Are you sure you want to continue connecting? (yes/no)":
```
root@ip-172-31-23-12:~# ssh-keyscan -H gitlab.example.com >> ~/.ssh/known_hosts
# gitlab.example.com:22 SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.2
# gitlab.example.com:22 SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.2
# gitlab.example.com:22 SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.2
root@ip-172-31-23-12:~#
```
---

## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

We can set up our Stage and Production environments to track the "stage" and "prod" branches with a cron job like this, on each server:

```
* * * * * GIT_SSH_COMMAND="ssh -i ~/.ssh/pull_from_git" git archive --remote=git@gitlab.example.com:root/www.git prod www/html/ 2>/dev/null| tar -x --transform s:www/html:/var/www/prod-html: -C / 2>/dev/null
```

---
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

For real-world use, you may want a tool like [Travis-CI dpl](https://docs.gitlab.com/ce/ci/examples/deployment/README.html) 
which can deploy to a wide variety of [service providers](https://github.com/travis-ci/dpl#supported-providers). 
