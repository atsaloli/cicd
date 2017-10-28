# Set up CI

Notice the "Set up CI" button:

![notice the "Set up CI" button](img/setup_ci.png)

Select "Set up CI" to add the CI config file, `.gitlab-ci.yml`.

The config file format is detailed in  
[Configuration of your builds with .gitlab-ci.yml - GitLab Documentation](https://docs.gitlab.com/ce/ci/yaml/README.html)

This is _the_ reference for GitLab CI configuration syntax!

Let's start with a stub test job:


```
test_it:
  script: /bin/echo I am a pretend test suite. I passed!
```
![first CI job](img/pretend_test_1.png)

Select "Commit changes" at the bottom, green.

Our first CI test job, "test_it" will run on every single commit 
to test the new revision. It will execute the /bin/echo command.

Notice that GitLab automatically checks the syntax of the CI config file
and will alert you if the config does not pass validation.

You may notice the "pending" indicator - that's because we haven't
set up a Runner Server yet to run the job:

![pending pipeline](img/pending_pipeline.png)


Go to "CI/CD -> Pipelines" to see our pipeline status:

![pipelines menu](img/pipelines_menu.png)

Here is the status:

![stuck pipeline](img/stuck_pipeline.png)

The pipeline is stuck in Pending, because we haven't setup any runners yet. 
We'll do that next.

### Definition: runner
A GitLab "runner" is an abstraction. The GitLab Runner service is a
single Go `gitlab-ci-multi-runner` process on a GitLab Runner server;
the "runner" concept provides a way for GitLab to tell the
`gitlab-ci-multi-runner` process what type of environment to use
for building and testing the code (e.g. shell, Docker container,
Vagrant or Parallels VM, Kubernetes), and to communicate the
variables needed to connect to different APIs, etc. 

The "runner" abstraction provides a way to control access at
the project level, e.g.  project X will use runner X' (which has
variables X-a, X-b and X-c); and project Y will use runners Y1,
Y2 and Y3 (with variables Y-a, Y-b and Y-c).  But on the back end,
behind the wizard curtain, it's just one 'gitlab-ci-multi-runner`
process.  "Runners" are a very useful fiction.

# [[Next]](15-installing-docker.md) [[Up]](README.md)
