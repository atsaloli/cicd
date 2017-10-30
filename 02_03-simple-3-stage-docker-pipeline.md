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
  - /bin/echo This is a mock test job
  - ls -lh /tmp/build
  - touch /tmp/test
  - ls -lh /tmp/test
  tags:
  - docker 
```
