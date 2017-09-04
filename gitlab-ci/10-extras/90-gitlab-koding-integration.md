[GitLab Koding documentation](http://gitlab.example.com/help/administration/integration/koding) describes how to install Koding on your GitLab server

GitLab's docs for integrating Koding are at http://gitlab.example.com/help/administration/integration/koding

You need to install Koding and then integrate it with GitLab

## Hardware requirements
2 cores and 3 GB of RAM and 10 GB disk.

I used an Hardware Virtual Machine.

I had to mount /mnt as /home, otherwise we don't have enough disk space for "kd".

## Installing Docker



Koding requires Docker Engine and Docker Compose

### Installing Docker Engine

Install Docker following the official instructions
at https://docs.docker.com/engine/installation/linux/ubuntulinux/


### Installing Docker Compose


https://docs.docker.com/compose/install/

Then you can enable Koding under http://gitlab.example.com/admin/application_settings

# Install KD

- Give up on getting Koding going, and just sign up for vsa.koding.com
- Install "KD" from vsa.koding.com onto the koding.example.com VM:

```
Your Kite Query ID, which you can use as a credential for local provisioning, is:

      57382989-ef48-42ec-a459-90c9f176f041


```

# integrating Koding with GitLab SSO

go to "Integrations" and follow the instructions

# integrating GitLab with Koding

You need to enable Koding in the Koding section in http://gitlab.gitlabtutorial.org/admin/application_settings
