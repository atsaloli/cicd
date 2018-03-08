## Setting up your CI/CD infrastructure

### Installing GitLab Server

#### Creating a host

During the tutorial, you'll be provided a Strigo VM (running Ubuntu
16 LTS). Your Strigo VMs will be destroyed after the workshop.

To continue your study after workshop, you can use a host in a public
cloud (such as [Joyent](joyent.com) or AWS). The Joyent instance parameters I use are:

- Virtual Machine (to run Docker)
- Ubuntu 16 LTS (ubuntu-certified-16.04)
- High CPU with 8 GB of RAM (4 GB for GitLab Server, and 4 GB for GitLab Runner)

---
## Setting up your CI/CD infrastructure

### Installing GitLab Server

#### Strigo VM

URL:  [https://app.strigo.io/event/rrKqGKafLrApdWGw6](https://app.strigo.io/event/rrKqGKafLrApdWGw6)
 
Code:  ...
---
## Setting up your CI/CD infrastructure

### Installing GitLab Server

#### Strigo Web terminal: Copying and Pasting

On the Mac, you can use the usual hotkeys (Command-C to copy and Command-V to paste).

On other systems:
- Copying: highlight the text, right-click in the Web browser and select "Copy" from the menu.
- Pasting: use Ctrl-Shift-V, or right-click and select "Paste".

---
## Setting up your CI/CD infrastructure

### Installing GitLab Server

#### Community Edition vs Enterprise Edition

We'll install GitLab EE (Enterprise Edition) which is functionally
identical to GitLab Libre (formerly called CE, or Community Edition)
until you install an EE license to enable the additional features.
This makes upgrading to EE a breeze.

We'll use the official package from GitLab.  GitLab releases a
new version on the 22nd of every month -- and always with new
features!
---
## Setting up your CI/CD infrastructure

### Installing GitLab Server

#### Add GitLab repository definition and install GitLab EE package

```console
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo apt-get install gitlab-ee 
```

Pro tip: Use "x" in your Web browser to select the code block above.

Note - The above is just enough to
get GitLab up for our tutorial. The full installation instructions are at
[https://about.gitlab.com/installation](https://about.gitlab.com/installation/) 
(and if you need to set up outgoing email for notifications, or HTTPS, it's covered there.)
---
## Setting up your CI/CD infrastructure
### Installing GitLab Server
#### Note your GitLab URL

The installer will print the URL of your GitLab Server instance below the
GitLab _tanuki_.

The _tanuki_ is also known as the Asiatic racoon, or racoon dog.
It's a member of the dog family.

You can see a picture of the tanuki [here](https://commons.wikimedia.org/wiki/File:Tanuki01_960.jpg).

---
GitLab adopted the tanuki as its mascot because the tanuki is smart, and works in a group
to achieve a comman goal -- and thus symbolizes GitLab vision of enabling collaboration.

![GitLab tanuki logo](https://about.gitlab.com/images/press/logo/wm_no_bg.svg)

---
## Setting up your CI/CD infrastructure
### Installing GitLab Server
#### Note your GitLab URL

Your GitLab URL will be under the tanuki ASCII art:

```text
       *.                  *.
      ***                 ***
     *****               *****
    .******             *******
    ********            ********
   ,,,,,,,,,***********,,,,,,,,,
  ,,,,,,,,,,,*********,,,,,,,,,,,
  .,,,,,,,,,,,*******,,,,,,,,,,,,
      ,,,,,,,,,*****,,,,,,,,,.
         ,,,,,,,****,,,,,,
            .,,,***,,,,
                ,*,.



     _______ __  __          __
    / ____(_) /_/ /   ____ _/ /_
   / / __/ / __/ /   / __ \`/ __ \
  / /_/ / / /_/ /___/ /_/ / /_/ /
  \____/_/\__/_____/\__,_/_.___/


Thank you for installing GitLab!
GitLab should be available at http://ec2-52-59-79-192.eu-central-1.compute.amazonaws.com
```

---
## Setting up your CI/CD infrastructure
### Installing GitLab Server

![important](img/important-one-tenth.png)  
Note your GitLab URL, you *will* need it later.

---
## Setting up your CI/CD infrastructure
### Installing GitLab Server

![important](img/important-one-tenth.png)  
Did you note your GitLab URL?

---
## Setting up your CI/CD infrastructure
### Installing GitLab Server

Go to your GitLab Server using the URL you noted in the previous step
and set the password for `root`, the initial user on the system.

![login](img/login.png)
