
# Export PGP private key to add in github action
```
gpg --export-secret-keys --armor 68C93B37CB74875F > pgp-private-key.asc
```

# Edit and update 
```
sops secrets/transaction-secret.yaml
sops secrets/postgresql-secret.yaml

// After you run any of one command it will automatically decrypt, open vi edit and after you save it will encrypt again and will save
```

# Manual encyption command
```
sops --encrypt --gpg 68C93B37CB74875F --in-place secrets/postgresql-secret.yaml
sops --encrypt --gpg 68C93B37CB74875F --in-place secrets/transaction-secret.yaml
```

# Command to decrypt and apply in kubernetes
```
sops --decrypt secrets/transaction-secret.yaml | kubectl apply -n <namespace> -f -
sops --decrypt secrets/postgresql-secret.yaml | kubectl apply -n <namespace> -f -
```