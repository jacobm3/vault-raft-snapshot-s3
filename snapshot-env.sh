HOSTNAME=vault.you.com
PORT=8200
DIR=/home/ubuntu/snapshots.vault
BUCKET=your-bucket-name

VAULT_ADDR=https://${HOSTNAME}:${PORT}
VAULT_APPROLE_ID=snapshot
VAULT_APPROLE_SECRET=your-secret-id

AWS_DEFAULT_REGION=us-east-1
AWS_ACCESS_KEY_ID=xxx
AWS_SECRET_ACCESS_KEY=yyy

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:${HOME}/bin

export VAULT_ADDR AWS_DEFAULT_REGION AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY PATH

