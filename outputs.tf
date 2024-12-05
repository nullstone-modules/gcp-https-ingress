output "public_ip" {
  value       = google_compute_global_address.static-ip.address
  description = "string ||| The IP address created for this ingress."
}

output "certificate_id" {
  value       = google_certificate_manager_certificate.this.id
  description = "string ||| The ID of the Certificate Manager certificate created for this ingress."
}

output "certificate_map_id" {
  value       = google_certificate_manager_certificate_map.this.id
  description = "string ||| THe ID of the Certificate Manager Map that contains the certificate."
}
