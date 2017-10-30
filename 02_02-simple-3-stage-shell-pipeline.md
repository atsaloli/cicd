## Configuring CI/CD pipelines
### Continuous Integration
#### Simple 3 stage pipeline (Shell version)

Try running this pipeline:

```yaml 
build_job:
  stage: build
  tags:
  - shell
  script:
  - touch /tmp/build
  - ls -lh /tmp/build

test_job:
  tags:
  - shell
  script:
  - ls -lh /tmp/build 
```

Check the console log for each job.

Notice that with the Shell runner, the build environment is shared
between jobs.
