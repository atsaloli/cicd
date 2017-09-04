# Configure GitLab to send notifications to chat

## Enable incoming webhooks in Mattermost
 
Go to: System Console -> Integrations -> Custom Integrations
 
Enable incoming and outgoing webhooks and custom slash commands

## Setup an Incoming Webhook in Mattermost

Go to Integrations -> Incoming Webhooks -> Add Incoming Webhook


## Configure GitLab notifications to Mattermost

Go to Project Settings -> Services -> Slack.

Turn on the Slack service.

(Mattermost is Slack-compatible.)

Confirm that git events (push ,commit, tag, merge etc) now result in chat
messages in Mattermost.


Note: You can  create a Service Template for Slack (under Admin Tools),
and all new projects will inherit that Service definition.