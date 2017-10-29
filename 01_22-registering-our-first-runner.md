
## Setting up your CI/CD infrastructure

### Registering runners

#### Introduction

In this section, we will learn how to register runners

---

## Setting up your CI/CD infrastructure
### Registering runners


Go to "Settings" (gear icon in the vertical nav bar on the left), and select "CI/CD":

![CI/CD settings](img/settings_cicd.png)

---

## Setting up your CI/CD infrastructure
### Registering runners

Find and select "Runner settings" in the menu:

![CI/CD settings](img/runner_settings_menu.png)

---
## Setting up your CI/CD infrastructure
### Registering runners


There'll be no runners listed (we haven't set up any yet), 
but notice the instructions (in the left pane) for registering
runners with the GitLab API endpoint:

![no runners yet](img/runner_menu.png)

---

## Setting up your CI/CD infrastructure
### Registering runners


To register a runner, run:

```bash
sudo gitlab-ci-multi-runner register
```
You'll be prompted for:
- The GitLab Server API endpoint URL (to pick up jobs, return outcomes and upload build artifacts). You can get it from GitLab's runner settings.
- Registration token. You can get it from GitLab's runner settings, too.
- For description, put "Shell runner" (the first runner will be a shell runner)
- Don't put any tags (you can tag runners, and then list tags in jobs to route jobs to specific runners)
- Don't lock the runner to a project (not locking the runner makes it a shared runner, so it can be shared between projects)
- For executor, pick "shell". The executor type tells the Runner Server in what kind of environment to execute the job (e.g., shell, SSH, Vagrant, Docker, Kubernetes).

---
## Setting up your CI/CD infrastructure
### Registering runners
Confirm the runner was created:

```bash
sudo gitlab-runner list
```

Example:

```shell_session
ubuntu@ip-172-31-24-94:~$ sudo gitlab-runner list
Listing configured runners    ConfigFile=/etc/gitlab-runner/config.toml
Shell runner                  Executor=shell Token=296362d1338ca9b3c2862a4f7570c2 URL=http://ec2-52-58-90-232.eu-central-1.compute.amazonaws.com/
ubuntu@ip-172-31-24-94:~$

```
---

## Setting up your CI/CD infrastructure
### Registering runners
You can also register runners non-interactively (don't do it now):

```console
sudo gitlab-runner register --non-interactive \
                            --url <url> \
                            --registration-token <token> \
                            --executor shell \
                            --description "Shell Runner"
```

---

## Setting up your CI/CD infrastructure
### Registering runners
Refresh the "CI/CD settings" page and expand "Runner settings" again.
You should see your Shell runner. (See next slide.)

---?image=img/shell_runner_in_UI.png


---

## Setting up your CI/CD infrastructure
### Registering runners
Notice the green "ready" light. The runner is checking in:


![green is good](img/shell_runner_green.png)

---

## Setting up your CI/CD infrastructure
### Registering runners
Notice also you can select the runner id (next to the green light) to see
runner detail; and that you can select the "edit" icon (next to the id)
to change the runner's configuration. (Don't change anything yet.)

---

## Setting up your CI/CD infrastructure
### Checking pipeline status

Select "CI/CD" -> "Pipelines" in the menu:

![cicd pipelines menu](img/cicd_pipelines_menu.png)

---

## Setting up your CI/CD infrastructure
### Checking pipeline status

Remember the job that was pending because no runner was available?
It should now say "Passed":

![unstuck](img/unstuck.png)

---

## Setting up your CI/CD infrastructure
### Checking pipeline status
Select the "Passed" icon to see pipeline detail:

![passed](img/passed_icon.png)

---

## Setting up your CI/CD infrastructure
### Checking pipeline status
Now we see the stages of the pipeline and the jobs in each stage:

![pipeline view](img/pipeline_view.png)

Notice this pipeline only has one stage (Test) -- that's the default stage;
and one job in that stage, "test_it", which passed.

---

## Setting up your CI/CD infrastructure
### Checking pipeline status
Select the "test_it" job icon to see the detail for that run of the job:

![job icon](img/job_icon.png)

---

## Setting up your CI/CD infrastructure
### Checking pipeline status

The job detail includes the console log:

![job detail](img/job_detail.png)

Notice that the runner checked out the code from Git and then (pretend) tested it.
