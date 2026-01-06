terraform {
  required_version = ">= 1.0"

  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "~> 1.0"
    }
  }

  backend "remote" {
    organization = "asymmetrylab"

    workspaces {
      name = "asymmetrylab-landing"
    }
  }
}

provider "vercel" {
  # Vercel API token should be set as environment variable VERCEL_API_TOKEN
  # or passed via `api_token` argument
  # api_token = var.vercel_api_token

  # Team ID is optional if you have a personal account
  # team_id = var.vercel_team_id
}