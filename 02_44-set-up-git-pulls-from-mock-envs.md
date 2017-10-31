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
