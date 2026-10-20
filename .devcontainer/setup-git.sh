#!/bin/bash
# Let git in RStudio's Terminal use the Codespace's GitHub login

# 1. Save the Codespace's token to a private file
echo "${GITHUB_TOKEN}" > ~/.codespace_token
chmod 600 ~/.codespace_token

# 2. Tell git to read the login from that file
git config --global credential.helper ''
git config --global --add credential.helper '!f() { echo username=x-access-token; echo "password=$(cat ~/.codespace_token)"; }; f'
