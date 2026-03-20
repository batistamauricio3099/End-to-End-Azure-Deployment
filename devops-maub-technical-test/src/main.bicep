import { storageSku, storageKind, storageAccessTier } from './types.bicep'

param location string = resourceGroup().location
param baseName string
param sku storageSku
param kind storageKind
param accessTier storageAccessTier
param tags object
param principalId string
param webAppSku string

/* resource myRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
  tags: {
    Project: tags.Project
    Owner: tags.Owner
    Environment: tags.Environment
  }
} */

module stgModule './storage.bicep' = {
  name: 'storageDeploy'

  params: {
    storageAccountName: 'st${baseName}${uniqueString(resourceGroup().id)}'
    sku: sku
    kind: kind
    accessTier: accessTier
  }
}

module kvDeploy 'keyvault.bicep' = {
  name: 'kvDeploy'
  params: {
    keyVaultName: 'kv-${baseName}-${uniqueString(resourceGroup().id)}'
    location: location
    tags: tags
    principalId: principalId
  }
}

module webInfraDeploy './web-infra.bicep' = {
  name: 'webInfraDeploy'
  params: {
    location: location
    appServicePlanName: 'asp-${baseName}-${uniqueString(resourceGroup().id)}'
    webAppName: 'app-${baseName}-${uniqueString(resourceGroup().id)}'
    webAppSku: webAppSku 
    keyVaultName: kvDeploy.outputs.keyVaultName
  }
}

output keyVaultName string = kvDeploy.outputs.keyVaultName
output storageAccountName string = stgModule.outputs.storageAccountName
