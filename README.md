# HTTPS Ingress

Creates an HTTPS Ingress that utilizes managed GCP infrastructure.

## Details

This creates a Public IP Address and an SSL Certificate that can be used to route traffic to CDNs/Buckets or VMs.
This uses Google Certificate Manager and performs certificate validation by adding DNS records to the subdomain's zone.
