## Configuring CI/CD pipelines
### Continuous Integration
#### Two-stage pipeline (Docker version)

Try running this pipeline:

```yaml
job_1:
  stage: build
  script:
  - touch /tmp/build
  - ls -lh /tmp/build
  tags:
  - docker

job_2:
  stage: test
  script:
  - ls -lh /tmp/build
  tags:
  - docker 
```

Look at the console log for each job.

Why did the second job fail?
