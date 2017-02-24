## Install a GitLab CI Runner

Now let's install GitLab CI Runner as per [GitLab Runner install doc](https://docs.gitlab.com/runner/install/linux-repository.html)

(The first time, I did this on a dedicated  hardware virtual machine from Joyent (high cpu 1.75).
The second time, I put it on the same VM, even though that's not recommended, just to make 
it easier to handle having 12 GitLab instances for 12 students in 1 class.)

```
# Install Docker
curl -sSL https://get.docker.com/ | sh


# confirm Docker works
docker run alpine /bin/echo 'Hello world'


Example:

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

# Add GitLab CI repo
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash

# Install GitLab Runner
sudo apt-get install gitlab-ci-multi-runner

# add gitlab-runner to the docker group
usermod -aG docker gitlab-runner

# Register the runner
sudo gitlab-ci-multi-runner register
# Notes:
# - Use main GitLab URL (e.g. http://alpha-gitlab.gitlabtutorial.org` when prompted for coordinator URL
# - Get the token from /admin/runners in GitLab. 
# - Accept the default (hostname) for the description
# - Leave tags blank
# - Use "shell" for the executor, that's the simplest, good to start with


# Confirm GitLab Runner service is running
service gitlab-runner status

# List runners
gitlab-runner list

```

Now go back to my project, and observe that the Pipeline that was in "pending" before is now green checkmark "passed".  Yes!!

Let's examine the build output by selecting "passed" under Pipeline and then
selecting "passed" again, and we should see something like this:

```
Running with gitlab-ci-multi-runner 1.7.1 (f896af7)
Using Shell executor...
Running on 06424d2a-3480-4b66-a52f-eb9a4af9708f...
Cloning repository...
Cloning into '/home/gitlab-runner/builds/927f01f2/0/root/www'...
Checking out 28e875b6 as master...
$ /bin/echo hello world
hello world
Build succeeded
```

## Test Docker runner

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
