# Vault raft snapshots to s3

This repo contains a cron job that will take a raft snapshot of a remote Vault cluster and push it to an s3 bucket.

1. Run `vault-setup.sh` with a privileged token (root token or namespace admin).
1. Note the secret-id.
1. Create an AWS programmatic user with `aws-snapshot-policy.json` attached (update with your bucket name).
1. Update `snapshot-env.sh`.
1. Install the included cron job.
