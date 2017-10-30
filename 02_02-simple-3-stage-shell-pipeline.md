## Configuring CI/CD pipelines
### Continuous Integration
#### Simple 2 stage pipeline (Shell version)

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

Why is `/tmp/build` available to the second job?

Look at `/tmp/build` on your Runner Server.
