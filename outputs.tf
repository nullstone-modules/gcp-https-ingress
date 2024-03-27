output "public_ip" {
  value       = google_compute_global_address.static-ip.address
  description = "string ||| The IP address created for this ingress."
}

output "certificate_id" {
  value       = google_certificate_manager_certificate.this.id
  description = "string ||| The ID of the SSL Certificate (Certificate Manager) created for this ingress."
}
