# Add a project

- [Add a practice project](#add-a-practice-project)
- [Add a README.md to your project](#add-a-readme-md-to-your-project)
- [Get rid of the "add an SSH key" prompt](#get-rid-of-the--add-an-ssh-key--prompt)

## Add a practice project

Add a project. You will use this project to explore GitLab CI functionality.

Select the "New..." icon (it looks like a plus sign) and select "New project".

![new project](img/new_project.png)

Name the project. Call it "www" (we'll pretend it contains the source code
for our web site).

![name the project](img/name_project.png)

Select the big fat green "Create project" button to create your project.

## Get rid of the "add an SSH key" prompt

![create project](img/create_project.png)

GitLab will now take you to the "www" project page, and you should see
a prompt to add an SSH key to your profile so you can pull or push
project code.

![create project](img/ssh_warning.png)

Select "Don't show again" in the SSH warning, as in this tutorial,
you'll use the GitLab Web UI to change files in your project.

<!--
## Add an SSH key

![ssh_arning](img/ssh_warning.png)

Select "add an SSH key", and then, in your shell session,
create an SSH key:

![create key](img/ssh-keygen.png)

Whoomp! There it is:

![show key](img/show_key.png)


Add your public key to GitLab:

![add key](img/add_key.png)

Go back to your "www" project:

![go back to www project](img/go_back_to_www.png)

-->

## Add a README.md to your project

Add a README.md file by selecting "README" in the UI:

![add README](img/add_readme.png)

Put in some text (e.g., "I am a README file") and select "Commit changes"
to create the file.

![editing README](img/commit_readme.png)

You should then see the confirmation.

![README](img/new_readme.png)

Use the breadcrumbs at the top to go back to the main "www" project screen:

![breadcrumbs](img/breadcrumbs.png)

And you should now see the "Set up CI" button:

![notice the "Set up CI" button](img/setup_ci.png)


# [[Next]](13-enabling-ci-on-a-project.md) [[Up]](README.md)
