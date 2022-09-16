#!/bin/bash

# Contains config paramets in env vars, including creds
. /home/ubuntu/vault-raft-snapshot-s3/snapshot-env.sh


aws s3 sync /var/log/vault/archive/ s3://jm3-vault/log/${HOSTNAME}/
