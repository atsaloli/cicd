## Setting up your CI/CD infrastructure
### Set up trust
#### Allow runners to push to Prod via Git

Diagram:

![img](img/deploy-git.png)

---

## Setting up your CI/CD infrastructure
### Set up trust
#### Allow runners to push to Prod via Git


Generate SSH key in 'gitlab-runner' account on GitLab runner host:

```bash
sudo su - gitlab-runner -c "ssh-keygen -N '' -f ~/.ssh/push_to_git"
```
---
## Setting up your CI/CD infrastructure
### Set up trust
#### Allow runners to push to Prod via Git

Add the public key as a Deploy Key (deploy keys allowed to access the
git project in order to automate deployment of code):

Go to your "www" project,

Go to "Settings" tab,

Go to "Repository" sub-tab,

Select "Expand" option for "Deploy Keys".

Add the public key "push_to_git.pub" and check the "Write access allowed" checkbox.

---
## Setting up your CI/CD infrastructure
### Set up trust
#### Allow runners to push to Prod via Git

Run the following as root@Prod to add GitLab Server's host key:

```bash

sudo su - root -c "ssh-keyscan -H gitlab.example.com >> ~/.ssh/known_hosts"
```
---
## Setting up your CI/CD infrastructure
### Set up trust
#### Allow Prod to pull from Git

As root on Prod web server, generate a key called `pull_from_git`.

```bash
sudo su - root -c "ssh-keygen -N '' -f ~root/.ssh/pull_from_git"
```

---
## Setting up your CI/CD infrastructure
### Set up trust
#### Allow Prod to pull from Git

Add `pull_from_git.pub` as a "Deploy Key" and leave the "Write access allowed"
unchecked.

---
## Setting up your CI/CD infrastructure
##### Allow runners to push to Prod via Git## Set up trust


Test your access:

```bash
GIT_SSH_COMMAND="ssh -i ~/.ssh/pull_from_git" git clone git@gitlab.example.com:root/www.git /tmp/www
```
Later, we'll use this trust relationship to download code from Git
to the Web server document root.

(`GIT_SSH_COMMAND` requires Git v2.3.0 or newer. If you have an older Git, specify SSH key using `.ssh/config`.)
