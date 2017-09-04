# Key definitions

## Continuous Integration (CI)

Continuous Integration (CI) is a development practice that requires developers to integrate code into a shared repository several times a day. Each check-in is then verified by an automated build, allowing teams to detect problems early.

[Continuous Integration on ThoughtWorks.com](https://www.thoughtworks.com/continuous-integration)

## Jobs

`.gitlab-ci.yml` allows you to specify an unlimited number of jobs. Each job must have a unique name. A job is defined by a list of parameters that define the build behavior.

## Builds

Builds are individual runs of jobs. Not to be confused with a build job or build stage.

## Pipelines

A pipeline is a group of builds that get executed in stages (batches). All of the builds in a stage are executed in parallel (if there are enough concurrent Runners), and if they all succeed, the pipeline moves on to the next stage. If one of the builds fails, the next stage is not (usually) executed.

Pipelines are defined in `.gitlab-ci.yml` by specifying jobs that run in stages.

## Environments

`environment` is used to define that a job deploys to a specific environment. 

## Artifacts

`artifacts` is used to specify a list of files and directories which should be attached to the build after success.

## Runners

A "runner" is an abstraction. It's a way for GitLab to communicate with the gitlab-ci-multi-runner process on GitLab Runner server and to tell it what type of virtual environment to create (e.g. shell, docker, vagrant VM, Parallels VM, etc.) and the (secret) variables needed to connect to different APIs, etc.  Access to this abstraction can be controlled at the project level or using runner tags (runners can be tagged during registration, and build config can include those tags).

## See also

[Introduction to pipelines and builds](https://docs.gitlab.com/ce/ci/pipelines.html)
