# Set up trust relationship to deploy via SSH

We can have GitLab deploy our code after all tests pass.

There are different ways to deploy code.

In this section, we'll mock up deploying by pushing the code to the Web
server document root over SSH (scp or rsync).


## Stage

On the Runner Server, as the `gitlab-runner` user (which is the user
that the Runners run as), generate a key-pair for pushing code to Stage
Web server document root:

```bash
sudo su - gitlab-runner
mkdir .ssh; chmod 0700 .ssh
cd .ssh
ssh-keygen -f push_to_stg_docroot -N ''
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
cat ~gitlab-runner/.ssh/push_to_stg_docroot.pub >> ~/.ssh/authorized_keys
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

For real production, you'd want to use a non-root user as the owner
of the Web documents, so you don't have to give gitlab-runner root access 
in the environment.

## Prod

Do the same for Prod:

```bash
sudo su - gitlab-runner
ssh-keygen -f ~/.ssh/push_to_prod_docroot -N ''
```


Add the public key to root's `authorized_keys` file (as root):

```bash
sudo su -
cat ~gitlab-runner/.ssh/push_to_prod_docroot.pub >> ~/.ssh/authorized_keys
```

Now run as `gitlab-runner` the initial connection, to accept Prod host key:

```bash
su - gitlab-runner
ssh -i ~/.ssh/push_to_prod_docroot root@prod.example.com
```

# [[Up]](README.md)
