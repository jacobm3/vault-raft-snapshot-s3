#!/bin/bash

# Contains config paramets in env vars, including creds
. /home/ubuntu/bin/snapshot-env.sh

#
# Authenticate to Vault
#
loginjson=$(vault write -format=json auth/approle/login \
                role_id=$VAULT_APPROLE_ID \
                secret_id=$VAULT_APPROLE_SECRET)

export VAULT_TOKEN=$( echo $loginjson | jq -r .auth.client_token )

#
# Take Vault snapshot
#
mkdir -p $DIR
date > ${DIR}/cron.date

ts=$(date +%Y%m%d.%H%M%S.%s)
file=${DIR}/vault.${HOSTNAME}.${ts}.snap

vault operator raft snapshot save $file

#
# Copy snapshot to s3
#
aws s3 cp --storage-class STANDARD_IA \
  $file s3://${BUCKET}/snap/${HOSTNAME}/vault.${HOSTNAME}.${ts}.snap >/dev/null

#
# Expire old local snapshots
#
find $DIR -name *.snap -mtime +7 -exec rm -f {} \;

