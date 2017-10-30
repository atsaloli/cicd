## Configuring CI/CD pipelines
### Definitions of Key Terms
#### Continuous Integration (CI)

> Continuous Integration (CI) is a development practice that requires
> developers to integrate code into a shared repository several times
> a day. Each check-in is then verified by an automated build, allowing
> teams to detect problems early.

["Continuous Integration", ThoughtWorks.com](https://www.thoughtworks.com/continuous-integration)

---
## Configuring CI/CD pipelines
### Definitions of Key Terms
#### Jobs

The GitLab CI config file `.gitlab-ci.yml` allows you to specify an
unlimited number of jobs.

Each job must have a unique name.

A job is defined by a list of parameters that define its behavior.

You specify what a job does, and (optionally) when it does it.

For example, a job can build a package, test something, deploy something,
test it again after deploying it.

---
## Configuring CI/CD pipelines
### Definitions of Key Terms
#### (legacy term) Builds

"Builds" (also known as "jobs") are individual runs of jobs.
Not to be confused with a build job or a build stage, where
you are compiling or packaging the code.

The term "builds" is deprecated (due to the above potential
confusion); individual runs of jobs are now called jobs.
Older documentation and GitLab UIs still refer to "builds".
Newer ones say "jobs".

---
## Configuring CI/CD pipelines
### Definitions of Key Terms
#### Pipelines (and Stages)

A pipeline is a group of jobs that get executed in stages (batches).
All of the jobs in a stage are executed in parallel (if there are enough concurrent runners), and, if they all succeed, the pipeline moves on to the next stage.
If one of the jobs fails, the next stage is not (usually) executed.

Pipelines are defined in `.gitlab-ci.yml` by specifying jobs that run in stages.

Example pipeline with three stages:  Build -> Test -> Deploy

---
## Configuring CI/CD pipelines
### Definitions of Key Terms
#### Environments

The `environment` setting is used to note that a job deploys to a specific environment (e.g., stage or UAT, or prod).
It's used to track which environment a job deployed to, and the URL of the deployment in that environment.

---
## Configuring CI/CD pipelines
### Definitions of Key Terms
#### Artifacts

`artifacts` is used to specify a list of files and directories which should be attached to the build after success. You can browse artifact archives through the UI and download them, as well as make them accessible to subsequent stages and jobs.

---
## Configuring CI/CD pipelines
### Definitions of Key Terms
#### Runners

A "runner" is an abstraction.
It's a way for GitLab to communicate with the `gitlab-ci-multi-runner` process on GitLab Runner Server and to tell it what type of virtual environment to create (e.g. shell, docker, vagrant VM, Parallels VM, Kubernetes, etc.) and any variables (including secrets) needed to connect to different APIs, etc.
Access to this abstraction can be controlled at the project level or using runner tags (runners can be tagged during registration, and jobs can include those tags).

---
## Configuring CI/CD pipelines
### Definitions of Key Terms
#### See also

- [Introduction to pipelines and builds](https://docs.gitlab.com/ce/ci/pipelines.html)

