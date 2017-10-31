
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Add the following job to your `.gitlab-ci.yml` to add a manual "Play" button to deploy to production.

We're still dealing with "continuous delivery", not "continous deployment", so we'll only push changes to production after our (pretend) Change Control Board give us the thumbs up following successful testing in the Stage/UAT environment (see next slide):
---

```yaml 
deploy_to_prod:
  tags: 
    - shell
  stage: deploy
  environment: production
  when: manual
  script:
  - GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git push --force git@gitlab.example.com:root/www.git +HEAD:refs/heads/prod

```
---
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Explanation of the git command:

`GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git push --force git@gitlab.example.com:root/www.git +HEAD:refs/heads/prod`

- GIT_SSH_COMMAND to specify SSH command line options (such as `-i` to specify identity file) 
- `--force` override built-in safeguards (see `git-push` man page if you want details)
- `+` tells git to create the target branch if it doesn't exist
- `HEAD:ref/heads/prod` means the `HEAD` (tip) of the `prod` branch
