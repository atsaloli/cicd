## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploying to Stage (via SSH)

Run the following pipeline to test (with phpunit in a Docker container) and 
(if successful), deploy to Stage (with scp push from a Shell executor).

```yaml 
test:
  tags:
    - docker
  image: php
  script: 
  - apt-get update
  - apt install -y phpunit
  - phpunit UnitTest HelloTest.php

deploy_to_stage:
  stage: deploy
  script:
  - rsync -av -e 'ssh -i ~gitlab-runner/.ssh/push_to_stg_docroot' *.php root@stage.example.com:/var/www/stg-html/
  environment: stage
  tags: 
    - shell
```
---
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploying to Stage (via SSH)


In your job log, you should see the files sent over:

```
xxx

```

---

## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploying to Stage (via SSH)
You should now be able to see the code in action:

```console
curl http://stage.example.com:8008/Hello.php
```
