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

