locals {
  config_root_dir = "."

  enabled_services = [
    "cloudbuild.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
  ]

  project = {
    id     = "%GOOGLE_PROJECT_ID%"
    number = "%GOOGLE_PROJECT_NUMBER%"
  }

  region = {
    default            = "%REGION%"
    app_engine_default = "%APP_ENGINE_REGION%"
    storage_default    = "%STORAGE_REGION%"
  }

  infra_repository = {
    owner = "%GITHUB_OWNER%"
    name  = "%GITHUB_REPOSITOFY_NAME%"
  }
}
