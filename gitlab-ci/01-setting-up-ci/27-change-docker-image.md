# Use a different container image

Change your CI config to tell the Docker runner to use an Ubuntu container image:

```yaml
image: ubuntu

job1:
  script: cat /etc/*release
```

You can confirm in the build log that you are now creating an Ubuntu container:

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
