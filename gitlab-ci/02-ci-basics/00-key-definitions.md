# Key definitions

## Continuous Integration (CI)

> Continuous Integration (CI) is a development practice that requires
> developers to integrate code into a shared repository several times
> a day. Each check-in is then verified by an automated build, allowing
> teams to detect problems early.

[Continuous Integration on ThoughtWorks.com](https://www.thoughtworks.com/continuous-integration)

## Jobs

CI config file `.gitlab-ci.yml` allows you to specify an unlimited number of jobs.
Each job must have a unique name.
A job is defined by a list of parameters that define its behavior.

## Builds

Builds are individual runs of jobs. Not to be confused with a build job or a build stage.
(Note: GitLab is moving away from this confusing terminology, individual runs of jobs are now called jobs in most places. Some places in the software they are still called builds. Don't let this one trip you up.)

## Pipelines (and Stages)

A pipeline is a group of jobs that get executed in stages (batches).
All of the jobs in a stage are executed in parallel (if there are enough concurrent runners), and, if they all succeed, the pipeline moves on to the next stage.
If one of the jobs fails, the next stage is not (usually) executed.

Pipelines are defined in `.gitlab-ci.yml` by specifying jobs that run in stages.

Example pipeline with three stages:  Build -> Test -> Deploy

## Environments

The `environment` setting is used to note that a job deploys to a specific environment (e.g., stage or UAT, or prod).
It's used to track which environment a job deployed to, and the URL of the deployment in that environment.

## Artifacts

`artifacts` is used to specify a list of files and directories which should be attached to the build after success. You can browse artifact archives through the UI and download them, as well as make them accessible to subsequent stages and jobs.

## Runners

A "runner" is an abstraction.
It's a way for GitLab to communicate with the `gitlab-ci-multi-runner` process on GitLab Runner server and to tell it what type of virtual environment to create (e.g. shell, docker, vagrant VM, Parallels VM, Kubernetes, etc.) and any variables (including secrets) needed to connect to different APIs, etc.
Access to this abstraction can be controlled at the project level or using runner tags (runners can be tagged during registration, and jobs can include those tags).

## See also

[Introduction to pipelines and builds](https://docs.gitlab.com/ce/ci/pipelines.html)
