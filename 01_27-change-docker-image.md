## Setting up your CI/CD infrastructure
### Changing container image

Change your CI config to tell the Docker runner to use an Ubuntu container image for all jobs for this project:

```yaml
image: ubuntu

test_it:
  script: cat /etc/*release
  tags:
  - docker
```

Confirm in the job log that Runner Server is creating an Ubuntu container.
---

## Setting up your CI/CD infrastructure
### Changing container image per job

Not only can you specify the container image globally, you can override
the image definition _per job_:

```yaml
image: ubuntu

ruby_test:
  image: ruby
  script: cat /etc/*release
  tags:
  - docker

perl_test:
  image: perl
  script: cat /etc/*release
  tags:
  - docker

```
Make the above change (to `.gitlab-ci.yml`) and check the logs for each job, with attention to what image was used in each.
