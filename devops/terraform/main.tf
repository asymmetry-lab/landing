# Vercel Project
resource "vercel_project" "landing" {
  name      = var.project_name
  framework = "static"

  # Git repository integration
  git_repository = {
    type = "github"
    repo = "asymmetrylab/landing"
  }

  # Build and output settings
  root_directory = var.project_root_directory

  # Environment variables
  dynamic "environment_variable" {
    for_each = var.environment_variables
    content {
      key    = environment_variable.key
      value  = environment_variable.value.value
      target = environment_variable.value.target
    }
  }

  # Ignore build step for static site
  build_command   = null
  output_directory = null

  # Vercel configuration file (vercel.json) will be used
  # for additional settings like routes, aliases, etc.
}

# Custom domains
resource "vercel_project_domain" "domains" {
  for_each   = toset(var.domains)
  project_id = vercel_project.landing.id
  domain     = each.key

  # Wait for domain verification (manual step might be required)
  # verification_code will be output for DNS configuration
}

# Deployment (optional - triggers a deployment on apply)
resource "vercel_deployment" "initial" {
  project_id = vercel_project.landing.id
  ref        = "main"
  delete_on_destroy = false

  depends_on = [vercel_project_domain.domains]
}