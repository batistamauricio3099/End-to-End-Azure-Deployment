import { storageSku, storageKind, storageAccessTier } from './types.bicep'

param storageAccountName string
param sku storageSku
param kind storageKind
param accessTier storageAccessTier

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: resourceGroup().location
  sku: {
    name: sku
  }
  kind: kind
  properties: {
    accessTier: accessTier
  }
}

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name
output storageAccountPrimaryEndpointsBlob string = storageAccount.properties.primaryEndpoints.blob
