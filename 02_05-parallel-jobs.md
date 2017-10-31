## Configuring CI/CD pipelines
### Continuous Integration
#### Parallel jobs

Try running this pipeline:

```yaml
job_1:
  stage: build
  tags:
  - shell
  script: /bin/echo This is a mock build job

job_2a:
  tags:
  - shell
  script: /bin/echo I am job 2a
  
job_2b:
  tags:
  - shell
  script: /bin/echo I am job 2b

job_2c:
  tags:
  - shell
  script: /bin/echo I am job 2c 
```

Check the Pipeline detail view for this pipeline.

Notice that the "test" stage doesn't start until the "build" stage completes.

How are jobs visually represented as to what stage they belong to?
