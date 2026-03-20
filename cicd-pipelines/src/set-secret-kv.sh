#!/bin/bash
set -euo pipefail

kv_name="${1:-}"
secret_name="${2:-}"
secret_value="${3:-}"

if [[ -z "$kv_name" || -z "$secret_name" || -z "$secret_value" ]]; then
        echo 'Please provide key vault name, secret name, and secret value!' >&2
        exit 1
fi
echo "Progress: Saving secret '${secret_name}' in Key Vault '${kv_name}'..." >&2

if az keyvault secret set --vault-name "$kv_name" --name "$secret_name" --value "$secret_value" --query id -o tsv > /dev/null; then
    echo "Secret saved successfully." >&2
else
    echo "Failed to save secret in $kv_name." >&2
    exit 1
fi