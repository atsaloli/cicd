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
git push origin prod
cd ..
rm -rf www
exit
```

--- 
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Production environment will track the "prod" branch with a cron job:

```
* * * * * GIT_SSH_COMMAND="ssh -i ~/.ssh/pull_from_git" git archive --remote=git@gitlab.example.com:root/www.git prod www/html/ 2>/dev/null| tar -x --transform s:www/html:/var/www/prod-html: -C / 2>/dev/null
```

---
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

You may want to look into a tool like
[dpl](https://docs.gitlab.com/ce/ci/examples/deployment/README.html)
which can deploy to a wide variety of [service
providers](https://github.com/travis-ci/dpl#supported-providers).
