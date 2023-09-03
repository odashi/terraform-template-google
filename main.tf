terraform {
  # backend "gcs" {
  #   bucket = "%GOOGLE_PROJECT_ID%-terraform"
  # }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.80.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.80.0"
    }
  }
}

provider "google" {
  project         = local.project.id
  region          = local.region.default
  request_timeout = "60s"
}

provider "google-beta" {
  project         = local.project.id
  region          = local.region.default
  request_timeout = "60s"
}

module "terraform" {
  source = "./modules/terraform"

  depends_on = [google_project_service.common]

  config_root_dir = local.config_root_dir
  project         = local.project
  region          = local.region
  repository      = local.infra_repository
}
