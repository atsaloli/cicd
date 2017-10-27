# Installing GitLab Server

## Creating a host

In our live tutorial, you'll be provided a Strigo VM (running Ubuntu
16 LTS). You can go on to the next section.

For everyone else: you can provision a host in a public cloud (e.g.,
Joyent or AWS). The Joyent instance parameters I use are:

- Hardware Virtual Machine (to run Docker in the VM)
- Ubuntu 16 LTS (ubuntu-certified-16.04)
- High CPU with 8 GB of RAM (4 GB for GitLab Server, and 4 GB for GitLab Runner)


## Installing the package

We'll install GitLab EE (Enterprise Edition) which is functionally
identical to GitLab CE (Community Edition) until you install an
EE license to enable the additional EE features. This makes upgrading
to EE a breeze.

We'll use the official Omnibus GitLab package (which bundles every thing
into one package).

Add the GitLab package repository, and install the package:

```console
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo apt-get install gitlab-ee 
```

Note: The above is just enough installation instructions to
get GitLab up for our tutorial. The full version is at
https://about.gitlab.com/installation/ and you can look at that later
if you need more (e.g. mail notifications or HTTPS).


## Note the URL of your GitLab instance

The installer will print the URL of your GitLab Server instance below the
ASCII art of the GitLab icon, the tanuki (also known as Asiatic racoon,
or racoon dog).  Please make a note of the URL.

For example:

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

![important](img/important-one-tenth.png)
Note the URL of your GitLab instance, you *will* need it later.

## Setting password for "root"

Go to your GitLab Server using the URL you noted in the previous step and set the password for `root`, the initial user on the system.

You should see something like:

![login](img/login.png)

# [[Next]](12-setting-up-a-project.md) [[Up]](README.md)
