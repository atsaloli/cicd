# Setup a "www" project and enable CI

We will use this project to explore GitLab CI functionality.

## Add a project

Add a new project "www" 

Add an SSH key so you can commit to this project.

Add a README.md file:

Follow the steps in "Command Line Instructions -> Create a new repository"
to add the first file, `README.md`. (You use the SSH URL, not HTTPS,
so that you can use your SSH key to authorize access without having
to type in your password.)


## Enable CI

Select "www" in the top left to go to your "www" project main page

Notice that you are on the "Project" tab

Select "Set up CI" to add the CI config file, `.gitlab-ci.yml`.

The config file format is described in detail in  
[Configuration of your builds with .gitlab-ci.yml - GitLab Documentation](https://docs.gitlab.com/ce/ci/yaml/README.html)

Let's start with a stub test job:


```
test_it:
  script: /bin/echo I am a pretend test suite. You passed!
```

Select "Commit changes".

This "test" job will run on every single commit to test the new revision.

Notice that GitLab automatically checks the syntax of the CI config file
and will alert you if the config does not pass validation.

Go to "Pipelines" tab.

Notice you have a pipeline with status "Pending".  It's pending because
we haven't setup any Runners yet. We'll install the GitLab Runner service
and setup a runner next.

### Definition: Runner
A GitLab "runner" is an abstraction. It's a way for GitLab to tell the
Go `gitlab-ci-multi-runner` process on GitLab Runner server what type
of environment to create (e.g. shell, Docker, Vagrant VM, Parallels
VM, etc.) and to communicate the (secret) variables needed to connect
to different APIs, etc.  It also provides a way to control access
at the project level (a runner can be dedicated to a project) or
using tags (runners can be tagged during registration) and you can
then say I want THIS build job to run only on runners with tag X.
