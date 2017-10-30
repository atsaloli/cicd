## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git


Add this manual deploy-to-Prod job to your pipeline definition (so that after deploying to stage and passing User Acceptance Testing, our pretend Change Control Board can green-light the push to production):

```yaml
deploy_to_prod:
  tags:
    - shell
  stage: deploy
  when: manual
  environment: production
  script:
  - GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git push --force git@gitlab.example.com:root/www.git +HEAD:refs/heads/prod
```
---
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Here you can see the tests have passed, deploy to stage is in progress,
and that deploy to production is set to manual (you have to click the
Play triangle to start it):

![Deploy to STG in progress](images/deploy-to-stage-is-running.png)


---
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

After the deploy to stage completes, we see:

![Ready for deploy to PRD](images/manual-deploy-ready.png)

---
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

If you look at the pipeline detail, you can see the deploy to 
prod was skipped, and is tagged as a "manual" deploy:

![pipeline detail](images/pipeline-detail.png)
