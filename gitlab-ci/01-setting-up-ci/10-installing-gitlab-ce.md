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


## Installing the Omnibus package

We'll use the official Omnibus GitLab package (that's what GitLab documentation recommends)

Follow the download and installation instructions on https://about.gitlab.com/installation/#ubuntu

Select "local" when prompted for mail server configuration options. (We are not going to be using mail.)

After the installation is done, GitLab will tell you its URL.

Please make a note of this URL -- you will need it for the rest of the exercices.

Go to this URL, it will ask you to set the password for `root`, the default (and, right now, the only) user.

![login](img/login.png)

# [[Up]](README.md)
