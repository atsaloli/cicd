## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Now, instead of _pushing_ code to the system, let's build
a distributed system; where each environment _pulls_ changes
from Git.

Stage will pull from the "stage" branch, and Prod will pull
from the "prod" branch (while development continues
in "master").

When CI testing passes, deployment will occur as a two-step process:
1. The new code will be pushed to a Git branch ("stage" for Stage, and "prod" for Prod)
2. Each environment will pull in the changes from its respective Git branch


Add GitLab's host key to the environments' `known_hosts` database so that we can run `git` commands under cron (non-interactive) without dealing with "I haven't seen this host before. Are you sure you want to continue connecting? (yes/no)":
```
root@ip-172-31-23-12:~# ssh-keyscan -H gitlab.example.com >> ~/.ssh/known_hosts
# gitlab.example.com:22 SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.2
# gitlab.example.com:22 SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.2
# gitlab.example.com:22 SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.2
root@ip-172-31-23-12:~#
```

We can set up our Stage and Production environments to track the "stage" and "prod" branches with a cron job like this, on each server:

Stage:
``` 
* * * * * GIT_SSH_COMMAND="ssh -i ~/.ssh/pull_from_git" git archive --remote=git@gitlab.example.com:root/www.git stage www/html/ 2>/dev/null| tar -x -C / 2>/dev/null

```

Prod:
```
* * * * * GIT_SSH_COMMAND="ssh -i ~/.ssh/pull_from_git" git archive --remote=git@INSERT_YOUR_HOSTNAME_HERE:root/www.git prod www/html/ 2>/dev/null| tar -x --transform s:www/html:/var/www/prod-html: -C / 2>/dev/null
```

In the source repo, the Web files are in "www/html"; I am using GNU tar's --transform
to put them in `/var/www/prod-html` and `/var/www/stg-html` since we've shoe-horned
both websites onto one server.

For real-world use, you may want a tool like [Travis-CI dpl](https://docs.gitlab.com/ce/ci/examples/deployment/README.html) 
which can deploy to a wide variety of [service providers](https://github.com/travis-ci/dpl#supported-providers). 

