## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Now, instead of _pushing_ changes to the system,
let's build a distributed system; where runners push successfully
tested changes to special Git branches; and environments
_pulls_ changes from its respective Git.

We'll just use the Prod environment. Let's set up the deploy-to-prod
job to push to the "prod" branch in Git; and let's set up the Prod
environment to pull from the "prod" branch (while development continues
on the "master" branch).

```text 
Addition of feature 'b' triggers CI/CD 
            \

         a---b---c---d  branch 'master'
             |
             v
    branch 'prod' 

CI/CD pushes 'b' code to 'prod' branch

```
--- 
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Let's initialize the "prod" branch and ensure Prod can pull from it.

Initialize "prod" branch (off "master"):

```console
sudo su - gitlab-runner
GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git clone git@gitlab.example.com:root/www.git 
cd www
git checkout -b prod
GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git push origin prod   
cd ..
rm -rf www
exit
```
--- 
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git
Check that Prod can pull from "prod" branch:

```console
sudo su - root -c "GIT_SSH_COMMAND='ssh -i ~/.ssh/pull_from_git' git archive --remote=git@gitlab.example.com:root/www.git prod | tar -t"
```
You should see the list of file in the "prod" branch:

```shell_session
ubuntu@ip-172-31-23-12:~$ sudo su - root -c "GIT_SSH_COMMAND='ssh -i ~root/.ssh/pull_from_git' git archive --remote=git@gitlab.example.com:root/www.git prod | tar -t"
.gitlab-ci.yml
Hello.php
HelloTest.php
README.md
index.php
ubuntu@ip-172-31-23-12:~$
```
--- 
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Go ahead and install the files once manually, just to make sure it all works:


```console
sudo su - root -c 'GIT_SSH_COMMAND="ssh -i ~root/.ssh/pull_from_git" git archive --remote=git@gitlab.example.com:root/www.git prod | tar -xv -C /var/www/prod-html --exclude=.gitlab-ci.yml'
```

Example output:

```shell_session
ubuntu@ip-172-31-23-12:~$ sudo su - root -c 'GIT_SSH_COMMAND="ssh -i ~root/.ssh/pull_from_git" git archive --remote=git@gitlab.example.com:root/www.git prod | tar -xv -C /var/www/prod-html --exclude=.gitlab-ci.yml'
Hello.php
HelloTest.php
README.md
index.php
ubuntu@ip-172-31-23-12:~$
```

--- 
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Set up Production environment to track the "prod" branch with a `root` cron job:

```console 
echo '* * * * * root GIT_SSH_COMMAND="ssh -i ~root/.ssh/pull_from_git" git archive --remote=git@gitlab.example.com:root/www.git prod 2>/dev/null| tar -xv -C /var/www/prod-html --exclude=.gitlab-ci.yml 2>/dev/null' | sudo tee -a /etc/crontab
```
---
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git
##### See also

You may want to look into a tool like
[dpl](https://docs.gitlab.com/ce/ci/examples/deployment/README.html)
which can deploy to a wide variety of [service
providers](https://github.com/travis-ci/dpl#supported-providers).

The way CFEngine's [contrib/masterfiles-stage.sh](https://github.com/cfengine/core/tree/master/contrib/masterfiles-stage) handles Git is, it stages the changes in a side directory, validates them, and then does the tablecloth pull trick where it swaps out the old content and swaps in the new (with two back-to-back calls to `mv`) so you never get half old and half new.

Next best thing after that is instantiating a new environment with the new code.
