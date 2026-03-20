#!/bin/bash
set -euo pipefail

rsg="$1"
sta="$2"

if [[ -z "$rsg" || -z "$sta" ]]; then
        echo 'Please provide both resource group and storage account name!' >&2
        exit 1
fi

if connString=$(az storage account show-connection-string --resource-group "$rsg" --name "$sta" --query connectionString -o tsv); then
    echo "$connString"
    echo "Connection string retrieved successfully." >&2
else
    echo "Failed to retrieve connection string for $sta in $rsg." >&2
    exit 1
fi