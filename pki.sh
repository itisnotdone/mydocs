#!/bin/bash

root=$1

mkdir $root

# to generate passphrase
openssl rand \
  -base64 48 \
  > "$root"/passphrase.txt

# to generate a key(the key structure) using the passphrase
openssl genrsa \
  -aes128 \
  -passout file:"$root"/passphrase.txt \
  -out "$root"/ca_private.key 2048

# to see key structure
openssl rsa \
  -text \
  -passin file:"$root"/passphrase.txt \
  -in "$root"/ca_private.key

# to extract public part
openssl rsa \
  -passin file:"$root"/passphrase.txt \
  -in "$root"/ca_private.key \
  -pubout \
  -out "$root"/ca-public.key
