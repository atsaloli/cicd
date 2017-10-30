
## Setting up your CI/CD infrastructure
### Set up trust
#### Deploy to Stage via SSH

GitLab can deploy code provided all tests pass.

There are different ways to deploy code.

We'll consider two:
- **SSH**: pushing the changed files to the Stage Web server document root over SSH
- **Git**: pushing the changed files to a special Git branch, that Prod syncs from

There are other deployment mechanisms, e.g., there is a beta feature called Auto DevOps for deploying to application services in Kubernetes.

---
## Setting up your CI/CD infrastructure
### Set up trust
#### Deploy to Stage via SSH: generate key-pair

On the Runner Server, as the Runner Serve user `gitlab-runner`,
generate a key-pair for pushing code to Stage:

```bash
sudo su - gitlab-runner -c "mkdir .ssh; chmod 0700 .ssh; cd .ssh; ssh-keygen -f push_to_stg_docroot -N ''"
```

Example:

```shell_session
ubuntu@ip-172-31-23-12:~$ sudo su - gitlab-runner -c "mkdir .ssh; chmod 0700 .ssh; cd .ssh; ssh-keygen -f push_to_stg_docroot -N ''"
Generating public/private rsa key pair.
Your identification has been saved in push_to_stg_docroot.
Your public key has been saved in push_to_stg_docroot.pub.
The key fingerprint is:
SHA256:BByLmE0zfxHadk5ma4gKsnRSy8U+jMZcPanpJbbvdeQ gitlab-runner@ip-172-31-23-12
The key's randomart image is:
+---[RSA 2048]----+
|    +.o.o.       |
|   =.=o=..       |
|  o.o+++= =      |
|  = B o=.B .     |
|.o.O O..S +.     |
|.o+.o.=  .o      |
|.   .o   . E     |
|      . . .      |
|      .o         |
+----[SHA256]-----+
ubuntu@ip-172-31-23-12:~$ sudo ls ~gitlab-runner/.ssh
push_to_stg_docroot  push_to_stg_docroot.pub
ubuntu@ip-172-31-23-12:~$
```

---
## Setting up your CI/CD infrastructure
### Set up trust
#### Deploy to Stage via SSH: add public key to Stage authorized_keys

Add gitlab-runner@runner_server's public key to root@stage's `authorized_keys` list.  

Since in our tutorial runner_server and stage one and the same, you can just run:

```
sudo cat ~gitlab-runner/.ssh/push_to_stg_docroot.pub | sudo tee -a ~root/.ssh/authorized_keys
```


---
## Setting up your CI/CD infrastructure
### Set up trust
#### Deploy to Stage via SSH: type "yes"

Now run, as `gitlab-runner` the initial connection, to accept Stage host key:

```bash
sudo su - gitlab-runner
ssh -i ~/.ssh/push_to_stg_docroot root@stage.example.com
```

For example:

```shell_session
gitlab-runner@alpha:~$ ssh -i ~/.ssh/push_to_stg_docroot root@stage.example.com
The authenticity of host 'stage.example.com (8.19.33.153)' can't be established.
ECDSA key fingerprint is SHA256:wkRvdDEsd1bK6sweR5OSK6FYUpYLn8BT41xFkh2RJy4.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'stage.example.com' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-81-generic x86_64)
Certified Ubuntu Cloud Image
...
```
Now we can push files to the docroot, e.g.:

```
gitlab-runner@alpha:~$ date > date.txt
gitlab-runner@alpha:~$ cat date.txt
Thu Sep 21 09:31:14 UTC 2017
gitlab-runner@alpha:~$ scp -i ~/.ssh/push_to_stg_docroot date.txt  root@stage.example.com:/var/www/stg-html/date.txt
date.txt                                                                               100%   29     0.0KB/s   00:00
gitlab-runner@alpha:~$ curl http://stage.example.com:8008/date.txt
Thu Sep 21 09:31:14 UTC 2017
gitlab-runner@alpha:~$
```

In the real world, you'd want to set up a non-root user as the owner
of the Web documents, so you don't have to give gitlab-runner root access.
To keep the scope of this tutorial manageable, we won't do that here.
