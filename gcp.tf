data "google_client_config" "current" {}

locals {
  region = data.google_client_config.current.region
}
