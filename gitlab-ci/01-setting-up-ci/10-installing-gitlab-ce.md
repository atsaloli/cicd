# Installing GitLab CE

## Community Edition (CE), Enterprise Edition (EE)

GitLab CE is the Community Edition (open source) of GitLab.

There is also GitLab EE (Enterprise Edition) which comes with additional
features and commercial support. (We are a GitLab EE reseller, and offer
a discounted price to our students.)


## Creating a host

Note: GitLab recommends installing Runner Server on dedicated hosts (separate from the GitLab Server).

In this tutorial, I put GitLab Server and Runner Server on the the same host for convenience.

Provision the host on a public cloud (e.g., Joyent or AWS).  Here are the Joyent parameters I use:

- Data center: us-west-1 (closest to me)
- Hardware Virtual Machine (to run Docker inside the VM)
- Ubuntu 16 LTS (ubuntu-certified-16.04) (latest Ubuntu LTS)
- High CPU with 8 GB of RAM


## Change host name to human-readable one

Change hostname of your host before installing GitLab, since GitLab Server
will pick up the hostname (e.g., it'll be the hostname in "git clone"
URLs)

For example:

```
hostname alpha.gitlabtutorial.org
echo alpha.gitlabtutorial.org > /etc/hostname
echo '8.19.33.153 alpha.gitlabtutorial.org' >> /etc/hosts
```

Add DNS record or `/etc/hosts` file entry on your local computer so it's nicer to access the GitLab UI.

(e.g. `alpha.gitlabtutorial.org`) 


## Installing the Omnibus package

We'll use the official Omnibus GitLab package (that's what GitLab documentation recommends)

Follow the download and installation instructions on https://about.gitlab.com/installation/#ubuntu

Login and set the password for the default Administrator user, `root`
