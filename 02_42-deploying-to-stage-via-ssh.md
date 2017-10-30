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
Running with gitlab-ci-multi-runner 9.5.1 (96b34cc)
  on Shell runner (7ab09c42)
Using Shell executor...
Running on ip-172-31-23-12...
Fetching changes...
HEAD is now at 86a5217 Add new file
Checking out 86a52175 as master...
Skipping Git submodules setup
$ rsync -av -e 'ssh -i ~gitlab-runner/.ssh/push_to_stg_docroot' *.php root@stage.example.com:/var/www/stg-html/
sending incremental file list
Hello.php
HelloTest.php
index.php

sent 1,123 bytes  received 73 bytes  2,392.00 bytes/sec
total size is 865  speedup is 0.72
Job succeeded 
```

---

## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploying to Stage (via SSH)

You should now be able to see the code in action:

```console
curl http://stage.example.com:8008/index.php
```

Example:

```shell_session
ubuntu@ip-172-31-23-12:~$ curl http://stage.example.com:8008/index.php
<h1>Hello world</h1>
ubuntu@ip-172-31-23-12:~$
```
