# Deploying to Stage (via Git)

Run the following pipeline that tests (with phpunit) and deploys (by pushing code to the `stage` branch in Git, from where it gets slurped up by the STAGE website):

(Make sure to fill in the `<your server>` placeholder, below.)

```yaml

test:
  script: cd www/html && phpunit UnitTest UserTest.php

deploy_to_stage:
  stage: deploy
  script:
  - GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git push --force git@<your server>:root/www.git +HEAD:refs/heads/stage
  environment: stage
```

Explanation of the git command:


`GIT_SSH_COMMAND` allows us to define flags that ssh should use (to specify the identity key file).


`--force` allows us to push from master to stage overriding the built-in safeguards:

>       -f, --force
>           Usually, the command refuses to update a remote ref that is not an ancestor of the local ref used to overwrite it. Also, when --force-with-lease option is used, the command refuses to update a remote
>           ref whose current value does not match what is expected.
>
>           This flag disables these checks, and can cause the remote repository to lose commits; use it with care.

We're pushing to `HEAD` of the `stage` branch (`ref/heads/stage`).

The `+` tells git to create the target branch if it doesn't exist:

> By having the optional leading +, you can tell Git to update the <dst> ref even if it is not allowed by default (e.g., it is not a fast-forward.) 

The above two quotes are from the "git-push" man page.

# [[Up]](README.md)
