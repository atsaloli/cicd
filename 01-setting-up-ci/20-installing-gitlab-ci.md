# Disable GitLab.com Shared Runners

To better understand how GitLab CI works and how it fits in with GitLab, we will disable the GitLab.com Shared Runners (in the cloud) and will register our own GitLab CI runner provider and will register two runners, Shell and Docker.

Go to project Settings -> CI/CD Pipelines -> Shared Runners -> Disable shared runners.


# Installing GitLab CI Runner service

Reference: [GitLab Runner install doc](https://docs.gitlab.com/runner/install/linux-repository.html)


## Install Docker

Install Docker so that our GitLab CI Runner service can run jobs in Docker containers in addition to Shell jobs.


```
# Install Docker
curl -sSL https://get.docker.com/ | sudo sh


# confirm Docker works
docker run alpine /bin/echo 'Hello world'
```

Example of successful test:

```
# docker run alpine /bin/echo 'Hello world'
Unable to find image 'alpine:latest' locally
latest: Pulling from library/alpine
0a8490d0dfd3: Pull complete
Digest: sha256:dfbd4a3a8ebca874ebd2474f044a0b33600d4523d03b0df76e5c5986cb02d7e8
Status: Downloaded newer image for alpine:latest
Hello world
#
```

## Install GitLab CI

### Add GitLab CI repo
```
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash
```

### Install GitLab Runner
```
sudo apt-get install gitlab-ci-multi-runner
```

### Add gitlab-runner to the docker group
```
usermod -aG docker gitlab-runner
```

### Confirm GitLab Runner service is active (running)
```
service gitlab-runner status
```

### List runners

We haven't registered any runners yet, so there should not be any runners yet:

```
gitlab-runner list
```

### Register a Shell runner

```
sudo gitlab-ci-multi-runner register
```

Notes:
- Use main GitLab URL when prompted for coordinator URL.
- Get the registration token from Settings -> CI/CD Pipelines.
- For description, put "Shell runner".
- For executor, use "shell".
- Don't put any tags (we'll learn later how to tag jobs to route them to specific runners).

```

You can also register a runner non-interactively:

```
sudo gitlab-runner register --non-interactive \
                            --url https://gitlab.com/ \
                            --registration-token <token> \
			    --executor shell \
                            --description "Shell Runner"

```

### List runners

You should now see the Shell runner on your GitLab CI server:

```
gitlab-runner list
```

And you should see it in your GitLab UI, under Settings -> CI/CD Pipelines.


### Enable the shell runner for the "www" project

In Settings -> CI/CD Pipelines -> Specific Runners, find our Shell executor and select "Enable for this project".



# Examine pipeline
If our Pipeline was in "Pending" status before, it should now be in "Passed".

Select "Passed" under Pipeline and then select the build/job ("test_it"), and you should see something like this:

```
Running with gitlab-ci-multi-runner 1.7.1 (f896af7)
Using Shell executor...
Running on 06424d2a-3480-4b66-a52f-eb9a4af9708f...
Cloning repository...
Cloning into '/home/gitlab-runner/builds/927f01f2/0/root/www'...
Checking out 28e875b6 as master...
$ /bin/echo I am a pretend test suite
I am a pretend test suite
Build succeeded
```

### Disable Shell runner

Now disable the Shell runner for this project; we'll next bring up a Docker runner.

### Unregistering runners

If you should ever want to unregister a runner, run `gitlab-runner unregister` and
supply GitLab URL and runner token which you can get from "gitlab-runner list`.

Example:

```
gitlab-runner unregister --url https://gitlab.com/ --token 8fa8dbe717be4580f3e7ffd0d8514b
```

Note: the runner token is different from the registration token which you get from
the GitLab UI.

## Register Docker runner

Now let's pause that shell runner and register a Docker runner, to test CI with Docker.

Go to /admin/runners in the GitLab UI and select "pause".

Then run `sudo gitlab-ci-multi-runner register` like before but this time
put in `docker` instead of `shell` for the executor; and use `alpine` as
the default docker image because it is so lightweight.

Now change your `.gitlab-ci.yml` to the following:

```yaml
job1:
  script: cat /etc/*release
```

and commit your change, and you should see the build output identifying
the container as Alpine:

```
Running with gitlab-ci-multi-runner 1.7.1 (f896af7)
Using Docker executor with image alpine ...
Pulling docker image alpine ...
Running on runner-d26a3d34-project-1-concurrent-0 via 06424d2a-3480-4b66-a52f-eb9a4af9708f...
Fetching changes...
HEAD is now at 9f4fbfa change script
From http://alpha-gitlab.gitlabtutorial.org/root/www
   9f4fbfa..531f43e  master     -> origin/master
Checking out 531f43e1 as master...
$ cat /etc/*release
3.4.4
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.4.4
PRETTY_NAME="Alpine Linux v3.4"
HOME_URL="http://alpinelinux.org"
BUG_REPORT_URL="http://bugs.alpinelinux.org"
Build succeeded
```

Now change your YAML to use an Ubuntu container:

```yaml
image: ubuntu

job1:
  script: cat /etc/*release
```

Build log shows:

```
Running with gitlab-ci-multi-runner 1.7.1 (f896af7)
Using Docker executor with image ubuntu ...
Pulling docker image ubuntu ...
Running on runner-b00b74d1-project-1-concurrent-0 via 06424d2a-3480-4b66-a52f-eb9a4af9708f...
Cloning repository...
Cloning into '/builds/root/www'...
Checking out 29e8bd3c as master...
$ cat /etc/*release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=16.04
DISTRIB_CODENAME=xenial
DISTRIB_DESCRIPTION="Ubuntu 16.04.1 LTS"
NAME="Ubuntu"
VERSION="16.04.1 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.1 LTS"
VERSION_ID="16.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
VERSION_CODENAME=xenial
UBUNTU_CODENAME=xenial
Build succeeded
```
