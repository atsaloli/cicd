# Deploy via Git


## Set up gitlab-runner to push to Git

Generate SSH key in 'gitlab-runner' account on GitLab runner host:

```

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

Go to our "www" project, go to "Settings" tab, "Repository" sub-tab,
and select "Expand" option for "Deploy Keys". Add the public key
"push_to_git.pub" and check the "Write access allowed" checkbox.



## Set up Stage/Prod to pull from Git

As root, generate a key called "pull_from_git".

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

As it as a "Deploy Key" and leave the "Write access allowed"
checkbox unchecked.

Test your access (and here is when you would type "yes" to accept
the key if you were doing this on separate servers for Stage and Prod):

```
root@alpha:~# git clone git@alpha.gitlabtutorial.org:root/www.git /tmp/www
Cloning into '/tmp/www'...
remote: Counting objects: 24, done.
remote: Compressing objects: 100% (19/19), done.
remote: Total 24 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (24/24), done.
Checking connectivity... done.
root@alpha:~#
```

Later on, we'll use this trust relationship to download code from Git
and then install it to the docroot.
