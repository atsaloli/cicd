# Registering our first runner


## Register a Shell runner

You can define an "executor" for each runner. It tells GitLab CI/CD in
what kind of environment to execute the job.

The simplest executor is Shell - the job will run in a shell on the GitLab CI/CD server.

Register a runner:

```bash
sudo gitlab-ci-multi-runner register
```

Go to the "Settings" tab of your project, and then select the "Pipelines" sub-tab.

You'll see the URL you will need to provide GitLab Runner (tells it how to get to GitLab) as well as the registration token.

- For description, put "Shell runner".
- For executor, use "shell".
- Don't put any tags (we'll learn later how to tag jobs to route them to specific runners).
- Don't lock the runner to a project (not locking the runner makes it a shared runner, it can be shared between projects)


You can also register runners non-interactively:

```bash
sudo gitlab-runner register --non-interactive \
                            --url https://gitlab.com/ \
                            --registration-token <token> \
                            --executor shell \
                            --description "Shell Runner"
```

You should now see the Shell runner:

```bash
sudo gitlab-runner list
```

You should now see it in GitLab, under `Settings -> Pipelines -> Runners activated for this project`.

Click on the edit icon next to the runner name to see available settings. (Don't change anything yet.)

Now go to "Pipelines -> Pipelines" and check the status of the job that
was pending because no runner was available. It should now say "Passed".

Select "Passed" to see the details (console log) of the job.
