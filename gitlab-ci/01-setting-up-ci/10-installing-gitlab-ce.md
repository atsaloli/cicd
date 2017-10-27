# Installing GitLab CE

## Community Edition (CE), Enterprise Edition (EE)

GitLab CE is the Community Edition (open source) of GitLab.

There is also GitLab EE (Enterprise Edition) which comes with additional
features and commercial support. (I am a GitLab EE reseller, and offer
a discount to my students.)



## Creating a host

Note: GitLab recommends installing Runner Server on dedicated hosts.

In this tutorial, we put GitLab Server and Runner Server on the the same host
for convenience.

Provision the host on a public cloud (e.g., Joyent or AWS) or on your VM if 
you were provided one. Here are the Joyent parameters I use:

- Data center: us-west-1 (closest to me)
- Hardware Virtual Machine (to run Docker inside the VM)
- Ubuntu 16 LTS (ubuntu-certified-16.04) (latest Ubuntu LTS)
- High CPU with 8 GB of RAM


## Installing the Omnibus package

We'll use the official Omnibus GitLab package (which bundles every thing
into one package).

```console
# Add the GitLab package repository
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash

# Install GitLab Server
sudo apt-get install gitlab-ee

```

(Note: The above is the "short" version, which is just enough installation instructions for our tutorial. You can find the full version at https://about.gitlab.com/installation/)

The installer will print the URL of your GitLab Server instance below the ASCII art of the GitLab icon, the tanuki (also known as Asiatic racoon, or racoon dog).  Please make a note of the URL.

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
