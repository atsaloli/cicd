# Deploying to Stage (via SSH)

## Test -> Deploy (to Stage)

Run the following pipeline to test (with phpunit) and (if successful), deploy to the stage environemnt (with rsync push to stage).

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

You should now be able to see the code in action (mock UAT):
`curl http://stage.example.com/Hello.php`
