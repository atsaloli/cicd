## Setting up your CI/CD infrastructure
### Set up trust
#### Deploy via Git

## Allow "gitlab-runner" user to push to Git

Generate SSH key in 'gitlab-runner' account on GitLab runner host:

```bash
sudo su - gitlab-runner -c "ssh-keygen -N '' -f ~/.ssh/push_to_git"
```
---
## Setting up your CI/CD infrastructure
### Set up trust
#### Deploy via Git

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
#### Deploy via Git

Run the following command to type "yes" to accept GitLab Server's host key for the first time:

```bash
GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git clone git@INSERT_YOUR_GITLAB_HOSTNAME_HERE:root/www.git
```

Example:

```
gitlab-runner@alpha:/tmp/test1$  GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git clone git@alpha.gitlabtutorial.org:root/www.git
Cloning into 'www'...
The authenticity of host 'alpha.gitlabtutorial.org (8.19.33.153)' can't be established.
ECDSA key fingerprint is SHA256:wkRvdDEsd1bK6sweR5OSK6FYUpYLn8BT41xFkh2RJy4.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'alpha.gitlabtutorial.org' (ECDSA) to the list of known hosts.
remote: Counting objects: 48, done.
remote: Compressing objects: 100% (41/41), done.
remote: Total 48 (delta 3), reused 33 (delta 1)
Receiving objects: 100% (48/48), 4.89 KiB | 0 bytes/s, done.
Resolving deltas: 100% (3/3), done.
Checking connectivity... done.
gitlab-runner@alpha:/tmp/test1$
```
GIT_SSH_COMMAND requires Git v2.3.0 or newer. You can also specify the SSH key via `.ssh/config`.

---
## Setting up your CI/CD infrastructure
### Set up trust
#### Deploy via Git: set up Prod to pull from Git to Web document root

As root on Prod web server, generate a key called "pull_from_git".

```bash
sudo su - root -c "ssh-keygen -N '' -f ~root/.ssh/pull_from_git"
```


---
## Setting up your CI/CD infrastructure
### Set up trust
#### Deploy via Git: add Deploy Key

Add it as a "Deploy Key" and leave the "Write access allowed"
checkbox unchecked.

---
## Setting up your CI/CD infrastructure
### Set up trust
#### Deploy via Git: add Deploy Key
Test your access (and here is when you would type "yes" to accept
the key if you were doing this on separate servers for Stage and Prod):

```bash
GIT_SSH_COMMAND="ssh -i ~/.ssh/pull_from_git" git clone git@INSERT_YOUR_GITLAB_SERVER_HOSTNAME_HERE:root/www.git /tmp/www
```
Later, we'll use this trust relationship to download code from Git
so that we can put it in the Web server document root.
