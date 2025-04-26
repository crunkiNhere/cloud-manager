param location string = resourceGroup().location
param environment string = 'prod'
param appServicePlanSku object = {
  name: 'F1'
  tier: 'Free'
  size: 'F1'
  family: 'F'
  capacity: 1
}

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environment}-${uniqueString(resourceGroup().id)}'
  location: location
  sku: appServicePlanSku
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'app-${environment}-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'PYTHON|3.11'
      appSettings: [
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        }
      ]
    }
  }
}

resource staticWebApp 'Microsoft.Web/staticSites@2022-03-01' = {
  name: 'swa-${environment}-${uniqueString(resourceGroup().id)}'
  location: location
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    branch: 'main'
    repositoryToken: '${secrets.GITHUB_TOKEN}'
    repositoryUrl: 'https://github.com/${secrets.GITHUB_REPOSITORY}'
    buildProperties: {
      appLocation: '/'
      apiLocation: 'api'
      outputLocation: 'build'
    }
  }
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environment}-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    IngestionMode: 'ApplicationInsights'
    Request_Source: 'rest'
    Flow_Type: 'Bluefield'
    RetentionInDays: 30
  }
  sku: {
    name: 'Free'
  }
}

output webAppName string = webApp.name
output staticWebAppUrl string = staticWebApp.properties.defaultHostname
output appInsightsKey string = appInsights.properties.InstrumentationKey 