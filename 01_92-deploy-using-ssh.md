
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
sudo su - gitlab-runner -c "ssh-keygen -f push_to_stg_docroot -N ''"
```

For example:

```shell_session
root@alpha:~# su - gitlab-runner
gitlab-runner@alpha:~$ mkdir .ssh; chmod 0700 .ssh
gitlab-runner@alpha:~$ cd .ssh
gitlab-runner@alpha:~/.ssh$ ssh-keygen -f push_to_stg_docroot -N ''
Generating public/private rsa key pair.
Your identification has been saved in push_to_stg_docroot.
Your public key has been saved in push_to_stg_docroot.pub.
The key fingerprint is:
SHA256:rVfuv3ylogkdw5UBZRzKcqVAaVAIRYlBqKiZF8v8sV4 gitlab-runner@alpha.gitlabtutorial.org
The key's randomart image is:
+---[RSA 2048]----+
|   o+*+*+..+*.   |
|  . . o oo =.o   |
|..     .. = o    |
|o .      = .     |
|.= o    S = .    |
|+ = .    o =    .|
| . . oE o o .  ..|
|    o.   o o... .|
|   ..     o..o+o |
+----[SHA256]-----+
gitlab-runner@alpha:~/.ssh$
gitlab-runner@alpha:~/.ssh$
```

Add the public key to root's `authorized_keys` file.  
You'll have to do it as root:

```
sudo su -
cat ~gitlab-runner/.ssh/push_to_stg_docroot.pub >> ~root/.ssh/authorized_keys
```

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
