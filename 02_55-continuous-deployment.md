```yaml
stages:
  - test
  - deploy_to_stage
  - test_on_stage
  - deploy_to_prod

preflight_test:
  tags:
  - docker
  script: phpunit UnitTest HelloTest.php

deploy_to_stage:
  tags:
    - shell
  stage: deploy
  script:
  - rsync -av -e 'ssh -i ~gitlab-runner/.ssh/push_to_stg_docroot' *.php root@stage.example.com:/var/www/stg-html/
  environment:
    name: stage
    url: http://stage.example.com:8008/

test_in_stage:
  stage: test_on_stage
  script: curl http://stage.example.com:8008/Hello.php | grep ello

deploy_to_prod:
  stage: deploy_to_prod
  tags:
    - shell
  script:
  - GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git push --force git@gitlab.example.com:root/www.git +HEAD:refs/heads/prod
  environment:
    name: production
    url: http://prod.example.com:8008/
```
