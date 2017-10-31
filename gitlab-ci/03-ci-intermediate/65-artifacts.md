Let's say your build creates some artifacts, such as
.so files or binaries.  Let's say you want to pass
those artifacts on to other builds, or to pass them
along selectively.

In the below, "mydate.txt" represents a build artifact,
and it'll be passed along to all jobs except job_1 which
refuses any build artifacts by defining an empty list of
dependencies.

```yaml
job_0:
  stage: build
  script: date > mydate.txt
  artifacts:
    paths:
     - mydate.txt
    name: my_artifacts

job_1:
  dependencies: []
  script: ls

job_2:
  script: ls
```
You can browse and download build artifacts through the Web UI:

![browse and download build artifacts](/images/build-artifacts-in-ui.png)

job_1 did not get the file mydate.txt:


![job1](/images/job-1-no-mydate.png)

job_2 did:

![job2](/images/job-2-artifacts.png)
