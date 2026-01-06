output "project_id" {
  description = "ID of the created Vercel project"
  value       = vercel_project.landing.id
}

output "project_url" {
  description = "Production URL of the project"
  value       = vercel_project.landing.production_url
}

output "project_domains" {
  description = "List of custom domains configured for the project"
  value       = [for domain in vercel_project_domain.domains : domain.domain]
}

output "domain_verification_codes" {
  description = "Verification codes for custom domains (for DNS configuration)"
  value       = { for domain in vercel_project_domain.domains : domain.domain => domain.verification_code }
  sensitive   = true
}

output "deployment_url" {
  description = "URL of the initial deployment"
  value       = vercel_deployment.initial.url
}