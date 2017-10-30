## Configuring CI/CD pipelines
### Continuous Integration
#### Simple 3 stage pipeline (Shell version)

![3 stage pipeline](../images/3-stage-pipeline.png)

Try running this pipeline.

```yaml 
build_it:
  stage: build
  tags:
  - shell
  script:
  - /bin/echo This is a mock build job
  - touch /tmp/build
  - ls -lh /tmp/build

test_it:
  stage: test
  tags:
  - shell
  script:
  - /bin/echo This is a mock test job
  - ls -lh /tmp/build

deploy_it:
  stage: deploy
  tags:
  - shell
  script:
  - /bin/echo This is a mock deploy job
  - ls -lh /tmp/build
```
