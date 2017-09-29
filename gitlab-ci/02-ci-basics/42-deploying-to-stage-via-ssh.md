# Deploying to Stage (via SSH)

## Test -> Deploy (to Stage)

Run the following pipeline to test (with phpunit in a Docker container) and 
(if successful), deploy to the stage environment (with rsync push to stage).

NOTE: Edit your Docker and Shell runner settings as follows:
- uncheck "pick up untagged jobs" checkbox
- ensure each runner has a tag set ("docker" for the Docker one,
- and "shell" for the Shell one)


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
  - scp -i ~gitlab-runner/.ssh/push_to_stg_docroot -r www/html/ root@stage.example.com:/var/www/stg-html/
  environment: stage
  tags: 
    - shell


Example output of the deploy job:

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


# [[Up]](README.md)
