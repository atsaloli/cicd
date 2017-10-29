## Customizing GitLab Configuration

The GitLab config is in /etc/gitlab/gitlab.rb

GitLab ships with embedded git but let's install the system `git` package
so we don't have to fiddle with the `PATH` - we'll use git to control
our changes to GitLab config:


```bash
sudo apt install git
```

Now, let's setup our commit identity:

```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

Save the original config (needs to be done as root):

```bash
cd /etc/gitlab
sudo git init
sudo git add .
sudo git commit -m 'Initial commit of out-of-the-box Omnibus GitLab config'
```
Now we can change /etc/gitlab/gitlab.rb and track our changes using git.

