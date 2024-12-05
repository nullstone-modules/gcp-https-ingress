resource "google_certificate_manager_dns_authorization" "this" {
  name        = local.resource_name
  description = "Authorization for ${local.subdomain_name}"
  domain      = local.subdomain_name
  labels      = local.labels
}

resource "google_dns_record_set" "authorization_records" {
  managed_zone = local.subdomain_zone_id
  name         = google_certificate_manager_dns_authorization.this.dns_resource_record.0.name
  type         = google_certificate_manager_dns_authorization.this.dns_resource_record.0.type
  rrdatas      = [google_certificate_manager_dns_authorization.this.dns_resource_record.0.data]
  ttl          = 300
}

resource "google_certificate_manager_certificate" "this" {
  depends_on = [google_dns_record_set.authorization_records]

  name        = local.resource_name
  description = "${local.subdomain_fqdn}: Managed by Nullstone"
  labels      = local.labels

  managed {
    domains = [
      google_certificate_manager_dns_authorization.this.domain,
    ]
    dns_authorizations = [
      google_certificate_manager_dns_authorization.this.id,
    ]
  }
}

resource "google_certificate_manager_certificate_map" "this" {
  name   = local.resource_name
  labels = local.labels
}

resource "google_certificate_manager_certificate_map_entry" "this" {
  name         = local.resource_name
  labels       = local.labels
  map          = google_certificate_manager_certificate_map.this.name
  certificates = [google_certificate_manager_certificate.this.id]
  matcher      = "PRIMARY"
}
