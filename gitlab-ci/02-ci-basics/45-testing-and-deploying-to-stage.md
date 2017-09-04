# Testing and deploying to STAGE

The following will test with phpunit and if the test succeeds, will push the code to the stage branch in Git, from where it will get slurped up by the STAGE website:

```yaml

test:
  script: cd www/html && phpunit UnitTest UserTest.php

deploy_to_stage:
  stage: deploy
  script:
  - GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_stage" git push --force git@gitlab.gitlabtutorial.org:root/example4.git +HEAD:stage
  environment: stage
```
