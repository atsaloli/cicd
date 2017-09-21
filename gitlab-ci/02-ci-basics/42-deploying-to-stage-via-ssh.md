# Deploying to Stage (via SSH)

The following will test with phpunit and if the test succeeds, will push the code to the stage environment via rsync.

```yaml

test:
  script: cd www/html && phpunit UnitTest HelloTest.php

deploy_to_stage:
  stage: deploy
  script:
  - scp -i ~gitlab-runner/.ssh/push_to_stg_docroot -r www/html/ root@stage.example.com:/var/www/stg-html/
  environment: stage
```


Example:

```
Running with gitlab-ci-multi-runner 9.5.0 (413da38)
  on shell (88d325d7)
Using Shell executor...
Running on alpha.gitlabtutorial.org...
Fetching changes...
HEAD is now at 5d85ebf s
Checking out 5d85ebf6 as master...
Skipping Git submodules setup
$ scp -i ~gitlab-runner/.ssh/push_to_stg_docroot -r www/html/ root@stage.example.com:/var/www/stg-html/
Job succeeded
```
