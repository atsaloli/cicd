# Set up trust relationships to deploy to Stage and Prod via Git


## Allow "gitlab-runner" user to push to Git

Generate SSH key in 'gitlab-runner' account on GitLab runner host:

```bash
sudo su - gitlab-runner
ssh-keygen -N '' -f ~/.ssh/push_to_git
```

Example:

```shell_session
gitlab-runner@alpha:~$ ssh-keygen -N '' -f ~/.ssh/push_to_git
Generating public/private rsa key pair.
Your identification has been saved in /home/gitlab-runner/.ssh/push_to_git.
Your public key has been saved in /home/gitlab-runner/.ssh/push_to_git.pub.
The key fingerprint is:
SHA256:9UrzSOe4YacMdhL2tI+ZzHNqZWtPGp1vA5BeOqlCLxs gitlab-runner@alpha.gitlabtutorial.org
The key's randomart image is:
+---[RSA 2048]----+
|                 |
|                 |
|          . .    |
|         . + .   |
|        S * B    |
|       o * #oo . |
|      .E= @o*.=  |
|       +.@oX++ o.|
|       .+.@=o...o|
+----[SHA256]-----+
gitlab-runner@alpha:~$
```

Let's add the public key as a Deploy Key (deploy keys allowed to access the
git project in order to automate deployment of code):

Go to your "www" project,

Go to "Settings" tab,

Go to "Repository" sub-tab,

Select "Expand" option for "Deploy Keys".

Add the public key "push_to_git.pub" and check the "Write access allowed" checkbox.


Run the following command to type "yes" to accept GitLab Server's host key for the first time:

```bash
GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git clone git@INSERT_YOUR_GITLAB_HOSTNAME_HERE:root/www.git
```

Example:

```
gitlab-runner@alpha:/tmp/test1$  GIT_SSH_COMMAND="ssh -i ~gitlab-runner/.ssh/push_to_git" git clone git@alpha.gitlabtutorial.org:root/www.git
Cloning into 'www'...
The authenticity of host 'alpha.gitlabtutorial.org (8.19.33.153)' can't be established.
ECDSA key fingerprint is SHA256:wkRvdDEsd1bK6sweR5OSK6FYUpYLn8BT41xFkh2RJy4.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'alpha.gitlabtutorial.org' (ECDSA) to the list of known hosts.
remote: Counting objects: 48, done.
remote: Compressing objects: 100% (41/41), done.
remote: Total 48 (delta 3), reused 33 (delta 1)
Receiving objects: 100% (48/48), 4.89 KiB | 0 bytes/s, done.
Resolving deltas: 100% (3/3), done.
Checking connectivity... done.
gitlab-runner@alpha:/tmp/test1$
```
Note: GIT_SSH_COMMAND requires Git v2.3.0 or newer. You can also specify the SSH key via `.ssh/config`.

## Set up Stage/Prod to pull from Git

As root, generate a key called "pull_from_git".

```bash
sudo su - root -c "ssh-keygen -N '' -f ~root/.ssh/pull_from_git"
```

Example:


```shell_session
root@alpha:~# ssh-keygen -N '' -f ~/.ssh/pull_from_git
Generating public/private rsa key pair.
Your identification has been saved in /root/.ssh/pull_from_git.
Your public key has been saved in /root/.ssh/pull_from_git.pub.
The key fingerprint is:
SHA256:c3US3cNyp4Tv+je3mKLccj7HP+N4G9R1MEv+lYhTxfU root@alpha.gitlabtutorial.org
The key's randomart image is:
+---[RSA 2048]----+
|            .+Boo|
|            +=+O=|
|           oo+*oE|
|           ..oo.=|
|        S .  . .o|
|         o    o  |
|            .. . |
|        ...+.o+=+|
|         o=o+==*B|
+----[SHA256]-----+
root@alpha:~#
```

Add it as a "Deploy Key" and leave the "Write access allowed"
checkbox unchecked.

Test your access (and here is when you would type "yes" to accept
the key if you were doing this on separate servers for Stage and Prod):

```bash
GIT_SSH_COMMAND="ssh -i ~/.ssh/pull_from_git" git clone git@INSERT_YOUR_GITLAB_SERVER_HOSTNAME_HERE:root/www.git /tmp/www
```

Later, we'll use this trust relationship to download code from Git
so that we can put it in the Web server document root.

# [[Next]](../02-ci-basics/README.md) [[Up]](README.md)
