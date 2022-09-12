vault policy write snapshot-read - <<EOF
path "sys/storage/raft/snapshot" {
  capabilities = ["read"]
}
EOF

vault auth enable approle

vault write auth/approle/role/snapshot \
  token_policies="snapshot-read" \
    secret_id_ttl=0 \
    secret_id_num_uses=0 \
    token_num_uses=1 \
    token_ttl=1m \
    token_max_ttl=1m
    

vault write -force auth/approle/role/snapshot/role-id \
role_id=snapshot

vault list auth/approle/role
vault read auth/approle/role/snapshot/role-id

vault write -force auth/approle/role/snapshot/secret-id
