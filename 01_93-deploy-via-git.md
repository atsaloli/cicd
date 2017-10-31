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

Add the public key "push_to_git.pub" (you have to add the public key and give it a title) and check the "Write access allowed" checkbox.

Be careful pasting from the Strigo Web terminal, as it _will_ introduce line endings which will mangle your SSH key.

---
## Setting up your CI/CD infrastructure
### Set up trust
#### Allow runners to push to Prod via Git

Run the following as root@Prod to add GitLab Server's host key:

```bash

sudo su - root -c "ssh-keyscan -H gitlab.example.com >> ~root/.ssh/known_hosts"
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

Add `pull_from_git.pub` as a "Deploy Key" and leave "Write access allowed" checkbox
unchecked.

To add a deploy key:
- Go to your "www" project,
- Go to "Settings" tab,
- Go to "Repository" sub-tab,
- Select "Expand" option for "Deploy Keys".
- Add the public key "pull_from_git.pub" (including giving it a title, and unmangle the line breaks if pasting from Strigo Web terminal),
- Select "Add key"

---
## Setting up your CI/CD infrastructure
##### Allow runners to push to Prod via Git


Test your access:

```bash
sudo GIT_SSH_COMMAND="ssh -i ~root/.ssh/pull_from_git" git clone git@gitlab.example.com:root/www.git /tmp/www
```
Later, we'll use this trust relationship to download code from Git
to the Web server document root.

`GIT_SSH_COMMAND` requires Git v2.3.0 or newer. If you have an older Git, you can [specify SSH key for pulling from GitLab in your SSH client configuration file](https://www.cyberciti.biz/faq/force-ssh-client-to-use-given-private-key-identity-file/).
