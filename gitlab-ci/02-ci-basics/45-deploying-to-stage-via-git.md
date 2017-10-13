# Deploying to Stage (via Git)

Run the following pipeline that tests with phpunit, and deploys by pushing code to the `stage` branch in Git (from where the Stage environment will slurp it up):

(Make sure to fill in the `INSERT_YOUR_GITLAB_HOSTNAME` placeholder.)

```yaml

test:
  image: ubuntu
  script: 
  - apt-get update
  - apt install -y phpunit
  - cd www/html && phpunit UnitTest HelloTest.php
  tags:
    - docker

deploy_to_stage:
  stage: deploy
  script:
  - scp -i ~gitlab-runner/.ssh/push_to_stg_docroot -r www/html/ root@INSERT_YOUR_GITLAB_HOSTNAME:/var/www/stg-html/
  environment: stage
  tags: 
    - shell
```

Explanation of the git command:


`GIT_SSH_COMMAND` allows us to define flags that ssh should use (to specify the identity key file).


`--force` allows us to push from master to stage overriding the built-in safeguards:

> Usually, the command refuses to update a remote ref that is not an
> ancestor of the local ref used to overwrite it. Also, when 
> --force-with-lease option is used, the command refuses to update 
> a remote ref whose current value does not match what is expected.
>
> This flag disables these checks, and can cause the remote repository 
> to lose commits; use it with care.

We're pushing to `HEAD` of the `stage` branch (`ref/heads/stage`).

The `+` tells git to create the target branch if it doesn't exist:

> By having the optional leading +, you can tell Git to update the <dst> ref 
> even if it is not allowed by default (e.g., it is not a fast-forward.) 

The above two quotes are from the "git-push" man page.

# [[Up]](README.md)
