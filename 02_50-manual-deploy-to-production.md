# Test, Auto Deploy to STG, Manual Deploy to Production

AKA Continuous Delivery

## YAML

The following will test with phpunit and if the test succeeds, will push
the code to the stage branch in Git, from where it will get slurped up
by the STAGE website where it's available for human gatekeeper review
and manual push to production:


IMPORTANT NOTE -- update the hostname in the Git URL below to YOUR hostname.

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
  - GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git push --force git@ec2-35-157-23-11.eu-central-1.compute.amazonaws.com:root/www.git +HEAD:refs/heads/stage
  environment: stage
  tags: 
    - shell
    
deploy_to_prod:
  stage: deploy
  script:
  - GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git push --force git@ec2-35-157-23-11.eu-central-1.compute.amazonaws.com:root/www.git +HEAD:refs/heads/prod
  environment: production
  when: manual
  tags:
    - shell
```
## Deploy to STAGE in progress

Here you can see the tests have passed, deploy to stage is in progress,
and that deploy to production is set to manual (you have to click the
Play triangle to start it):

![Deploy to STG in progress](images/deploy-to-stage-is-running.png)


## Deploy to STAGE complete

After the deploy to stage completes, we see:

![Ready for deploy to PRD](images/manual-deploy-ready.png)

## Pipeline detail

If you look at the pipeline detail, you can see the deploy to 
prod was skipped, and is tagged as a "manual" deploy:

![pipeline detail](images/pipeline-detail.png)

## Notes on setup

My gitlab-runner account's SSH key is allowed to write to the GitLab repo
repo.

