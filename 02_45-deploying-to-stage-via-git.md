## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Run the following job that deploys by pushing code to the `prod` branch in Git:

```yaml

deploy_to_prod:
  tags: 
    - shell
  stage: deploy
  environment: production
  script:
  - scp -i ~gitlab-runner/.ssh/push_to_stg_docroot -r *.php root@gitlab.example.com:/var/www/prod-html/
```

---
## Configuring CI/CD pipelines
### Continuous Delivery
#### Deploy via Git

Explanation of the git command:


- `--force` allows us to push from master to stage overriding the built-in safeguards (see git-push man page for details)(
- `ref/heads/prod` means the `HEAD` of the `prod` branch
- `+` tells git to create the target branch if it doesn't exist
