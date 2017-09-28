# Add a project and enable CI for it

## Add a project

Add a new project. You will use this project to explore GitLab CI functionality.

Select the "New..." icon (it looks like a plus sign) and select "New project".

![new project](img/new_project.png)

Name the project. Call it "www" (we'll pretend it contains the source code
for our web site).

![name the project](img/name_project.png)

Select "Create project" (below).

![create project](img/create_project.png)

GitLab will now take you to the "www" project page, and you should see
a prompt to add an SSH key to your profile so you can pull or push
project code.

![create project](img/ssh_warning.png)

Go ahead and select "add an SSH key", and create and add your SSH key.

Create SSH key:

![create key](img/ssh-keygen.png)

Add your SSH key.


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
