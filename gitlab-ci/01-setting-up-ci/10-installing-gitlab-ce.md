# Installing GitLab CE


You can use GitLab.com (public GitLab) or spin up your own. The rest of this section
deals with spinning up your own.

## Creating a host

Note: GitLab recommends installing GitLab CI/CD on dedicated hosts (separate from the GitLab instance itself).

In this tutorial, I put CE and CI/CD on the the same host for convenience.

Provision the host on a public cloud (e.g., Joyent):

- Data center: us-west-1 (closest to me)
- Hardware Virtual Machine (so that we can 
- Ubuntu 16 LTS (ubuntu-certified-16.04)
- High CPU with 8 GB of RAM


## Change host name to human-readable one

Add DNS record (e.g. `alpha.gitlabtutorial.org`) so it's nicer to access the GitLab UI.

Change hostname of your host before installing GitLab, since GitLab UI will pick up the hostname (e.g., in "git clone" URLs)

For example:

```
hostname alpha.gitlabtutorial.org
echo alpha.gitlabtutorial.org > /etc/hostname
echo '8.19.33.153 alpha.gitlabtutorial.org' >> /etc/hosts
```



## Installing the Omnibus package

We'll use the official Omnibus GitLab package (that's what GitLab documentation recommends)

Follow the download and installation instructions on https://about.gitlab.com/installation/#ubuntu

Login and set the password for the default Administrator user, `root`
