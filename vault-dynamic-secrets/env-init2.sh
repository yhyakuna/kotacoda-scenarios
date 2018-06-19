#!/usr/bin/env bash
curl -L -o ~/vault.zip https://releases.hashicorp.com/vault/0.10.2/vault_0.10.2_linux_amd64.zip &&
unzip -d ~/.bin ~/vault.zip && rm ~/vault.zip

ssh root@host01 "curl -L -o ~/vault.zip https://releases.hashicorp.com/vault/0.10.2/vault_0.10.2_linux_amd64.zip && unzip -d  /usr/bin/ ~/vault.zip && rm ~/vault.zip"
ssh root@host01 "apt-get install jq -y"
