#!/usr/bin/env bash
curl -s -L http://assets.joinscrapbook.com/unzip -o ~/.bin/unzip
chmod +x ~/.bin/unzip

curl -s -L -o ~/vault.zip https://releases.hashicorp.com/vault/1.0.1/vault_1.0.1_linux_amd64.zip &&
unzip -d ~/.bin ~/vault.zip && rm ~/vault.zip

export VAULT_ADDR='http://127.0.0.1:8200'

apt-get install -y jq

vault server -dev -dev-root-token-id="root"

ssh root@host01 "curl -L http://assets.joinscrapbook.com/unzip -o /usr/bin/unzip && chmod +x /usr/bin/unzip && curl -L -o ~/vault.zip https://releases.hashicorp.com/vault/1.0.1/vault_1.0.1_linux_amd64.zip && unzip -d  /usr/bin/ ~/vault.zip && rm ~/vault.zip && apt-get install -y jq && vault server -dev -dev-root-token-id="root" &$ export VAULT_ADDR='http://127.0.0.1:8200' &"
