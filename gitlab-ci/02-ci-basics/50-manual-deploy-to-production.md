# Test, Auto Deploy to STG, Manual Deploy to Production


## YAML

The following will test with phpunit and if the test succeeds, will push the code to the stage branch in Git, from where it will get slurped up by the STAGE website where it's available for human gatekeeper review and manual push to production:

```yaml

test:
  script: cd www/html && phpunit UnitTest UserTest.php

deploy_to_stage:
  stage: deploy
  script:
  - GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_stage" git push --force git@gitlab.gitlabtutorial.org:root/example4.git +HEAD:stage
  environment: stage

deploy_to_prod:
  stage: deploy
  script:
  - GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_prod" git push --force git@gitlab.gitlabtutorial.org:root/example4.git +HEAD:production
  environment: production
  when: manual
```
## Deploy to STAGE in progress

Here you can see the tests have passed, deploy to stage is in progress,
and that deploy to production is set to manual (you have to click the
Play triangle to start it):

![Deploy to STG in progress](/images/deploy-to-stage-is-running.png)


## Deploy to STAGE complete

After the deploy to stage completes, we see:

![Ready for deploy to PRD](/images/manual-deploy-ready.png)

## Pipeline detail

If you look at the pipeline detail, you can see the deploy to 
prod was skipped, and is tagged as a "manual" deploy:

![pipeline detail](/images/pipeline-detail.png)

## Notes on setup

My gitlab-runner account's SSH key is allowed to write to the GitLab repo
repo via Profile Settings -> SSH Keys (as Deploy Keys get read only
Git access).

My mock production website instance (prd.gitlabtutorial.org) is
setup to export the "production" branch on GitLab to /var/www/html
using this rudimentary cron job:

```
* * * * * git archive --remote=git@gitlab.gitlabtutorial.org:root/example4.git production www/html/ 2>/dev/null | tar -x -C /var/ 2>/dev/null
```
For actual production use, you may want something more robust, such
as https://github.com/cfengine/core/blob/master/contrib/masterfiles-stage/common.sh
which checks out changes to a local mirrored repo, stages them and then
updates all the files at once with /bin/mv at the top level (e.g. /var/www/html).
