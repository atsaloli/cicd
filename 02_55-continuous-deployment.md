```yaml
stages:
  - test
  - deploy_to_stage
  - test_on_stage
  - deploy_to_prod

preflight_test:
  tags:
  - docker
  image: php
  script: apt-get update && apt install -y phpunit && phpunit UnitTest HelloTest.php

rsync_to_stage:
  tags:
    - shell
  stage: deploy_to_stage
  script:
  - rsync -av -e 'ssh -i ~gitlab-runner/.ssh/push_to_stg_docroot' *.php root@stage.example.com:/var/www/stg-html/
  environment:
    name: stage
    url: http://stage.example.com:8008/

functional_test:
  stage: test_on_stage
  script: curl http://stage.example.com:8008/ | grep Hello
  tags:
  - shell

push_to_prod_branch:
  stage: deploy_to_prod
  tags:
    - shell
  script:
  - GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git push --force git@gitlab.example.com:root/www.git +HEAD:refs/heads/prod
  environment:
    name: production
    url: http://prod.example.com:8008/
```
---
## Configuring CI/CD pipelines
### Continuous Deployment

Run the preceding pipeline and observe the different stages and jobs in each stage.

Now change `$my_greeting` in `Hello.php` from "Hello world" to "Hello everyone". What do you predict will happen when the pipeline runs? Observe what happens and see if you accurately predicted.
