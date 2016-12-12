# Deploy to stage/production branches

I generated SSH keys in 'gitlab-runner' account on my
GitLab runner host and added it to Administrator's SSH
keys in GitLab so that they can push to the stage/production
branches (one key for each branch, just to have granular
control -- I could have used the same key for both branches).

# Deploy to Stage/Production

I generated SSH keys on my stage and production web server
instances:

- /root/.ssh/push_to_stage
- /root/.ssh/push_to_prod

These are called "push to X" because they are used to push
to /var/www/html on the web server.

I added them as global Deploy Keys to GitLab, which allows
read-only access to all projects (Admin Tools -> Settings
-> Deploy Keys, or /admin/deploy_keys in your GitLab URL).

You can also add Deploy Keys per Project (in Project Settings).

I then ran a "git clone" once as root on each Web server instance
to type "yes" and add the GitLab host key to .ssh/known_hosts
so that when we do git operations from cron, it doesn't ask
whether to add the host key.

# PHP test

On the GitLab-Runner machine:

Install PHP so we can mock test PHP code with "php -l" (php lint)

```
sudo apt install php7.0-cli php7.0-fpm
```
Edit /etc/nginx/sites-enabled/default to enable PHP
restart nginx

Test with a test.php in /var/www/html to make sure it works

## Install phpunit

sudo apt install -y phpunit

# Install development tools

Install development tools so that we can build code.

```
sudo apt install -y build-essential
```
