variable "vercel_api_token" {
  description = "Vercel API token. Can also be set via VERCEL_API_TOKEN environment variable."
  type        = string
  sensitive   = true
  default     = null
}

variable "vercel_team_id" {
  description = "Vercel Team ID (optional). Required if using a team account."
  type        = string
  default     = null
}

variable "project_name" {
  description = "Name of the Vercel project"
  type        = string
  default     = "asymmetrylab-landing"
}

variable "project_root_directory" {
  description = "Root directory of the project (relative to repository root)"
  type        = string
  default     = "."
}

variable "domains" {
  description = "Custom domains to associate with the project"
  type        = list(string)
  default     = ["asymmetrylab.com"]
}

variable "environment_variables" {
  description = "Environment variables to set for the project"
  type = map(object({
    value      = string
    target     = list(string) # "production", "preview", "development"
    sensitive  = optional(bool, false)
  }))
  default = {
    NODE_ENV = {
      value     = "production"
      target    = ["production", "preview", "development"]
      sensitive = false
    }
  }
}