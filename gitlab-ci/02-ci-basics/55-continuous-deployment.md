# Automatic Deploy to Production

AKA Continuous Deployment

## YAML
```yaml

stages:
  - test
  - deploy_to_stage
  - test_on_stage
  - deploy_to_prod

test:
  script: cd www/html && phpunit UnitTest HelloTest.php

deploy_to_stage:
  stage: deploy_to_stage
  script:
  - GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git push --force git@alpha.gitlabtutorial.org:root/www.git +HEAD:refs/heads/stage
  environment: stage

test:
  stage: test_on_stage
  script: curl http://stage.example.com:8008/date.txt | grep Sep

deploy_to_prod:
  stage: deploy_to_prod
  script:
  - GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git push --force git@alpha.gitlabtutorial.org:root/www.git +HEAD:refs/heads/prod
  environment: production

```
