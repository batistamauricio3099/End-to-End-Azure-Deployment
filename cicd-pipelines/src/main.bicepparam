using './main.bicep'

param location = 'eastus'
param baseName = 'maub'
param sku = 'Standard_LRS'
param webAppSku = 'B1'
param kind = 'StorageV2'
param accessTier = 'Hot'
param tags = {
  Project: 'TechnicalTest'
  Owner: 'Mauricio Batista'
  Environment: 'test'
}
param principalId = ''
