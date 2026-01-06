# Terraform Infrastructure for Asymmetry Lab Landing

This Terraform configuration manages the Vercel infrastructure for the Asymmetry Lab landing page.

## Prerequisites

1. **Terraform** (>= 1.0) installed
2. **Vercel Account** with API access
3. **Vercel API Token** (create at https://vercel.com/account/tokens)
4. **GitHub Repository** connected to Vercel (optional, for automatic deployments)

## Setup

### 1. Configure Backend

The Terraform configuration uses a remote backend (Terraform Cloud). Update `provider.tf` if you want to use a different backend:

```hcl
# For local state (not recommended for team use)
backend "local" {
  path = "terraform.tfstate"
}

# For S3 backend (AWS)
backend "s3" {
  bucket = "asymmetrylab-terraform-state"
  key    = "landing/terraform.tfstate"
  region = "us-east-1"
}
```

### 2. Set Environment Variables

```bash
# Required
export VERCEL_API_TOKEN="your_vercel_api_token"

# Optional if using team account
export VERCEL_TEAM_ID="your_team_id"

# For Terraform Cloud (if using remote backend)
export TF_CLOUD_ORGANIZATION="asymmetrylab"
export TF_CLOUD_WORKSPACE="asymmetrylab-landing"
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review Plan

```bash
terraform plan
```

### 5. Apply Configuration

```bash
terraform apply
```

## Resources Created

This Terraform configuration will create:

1. **Vercel Project**: `asymmetrylab-landing`
   - Framework: Static
   - Connected to GitHub repository (if configured)
   - Environment variables (NODE_ENV=production)

2. **Custom Domains**: `asymmetrylab.com`
   - Requires DNS verification
   - Verification codes will be output after apply

3. **Initial Deployment**: Triggers a deployment from the main branch

## Domain Verification

After applying the Terraform configuration:

1. **Check outputs** for domain verification codes:
   ```bash
   terraform output domain_verification_codes
   ```

2. **Add DNS records** at your domain registrar:
   - TXT record: `_vercel.${DOMAIN}` = `${VERIFICATION_CODE}`
   - Or follow Vercel's domain verification instructions

3. **Wait for verification** (may take up to 24 hours)

4. **Update DNS A/AAAA records** to point to Vercel (if not using Vercel's nameservers)

## Environment Variables

Environment variables can be managed through Terraform or directly in Vercel dashboard. The current configuration sets:

- `NODE_ENV`: `production` (all environments)

To add more variables, update `variables.tf`:

```hcl
variable "environment_variables" {
  default = {
    NODE_ENV = {
      value     = "production"
      target    = ["production", "preview", "development"]
      sensitive = false
    }
    # Add more variables here
  }
}
```

## Updates and Changes

### Project Configuration

Most project settings are managed through `vercel.json` in the project root. Terraform handles:

- Project creation and linking
- Domain management
- Environment variables
- Team/organization settings

### Manual Changes

If you make changes directly in Vercel dashboard, run:

```bash
terraform refresh
terraform plan
```

To see differences and optionally sync them back to Terraform state.

## Destruction

To destroy all managed resources:

```bash
terraform destroy
```

**Note**: This will delete the Vercel project and all associated deployments. Custom domains will be disconnected but not deleted from your registrar.

## Troubleshooting

### Provider Authentication

- Ensure `VERCEL_API_TOKEN` is set correctly
- Check token permissions (needs project, deployment, domain access)
- For team accounts: set `VERCEL_TEAM_ID`

### Domain Issues

- DNS propagation can take time
- Ensure TXT records are correctly set
- Check Vercel dashboard for domain status

### Git Integration

- GitHub repository must exist before Terraform apply
- Vercel needs access to the repository (install GitHub integration)

## Best Practices

1. **Use Terraform Cloud** or similar for state management and collaboration
2. **Review plans** before applying changes
3. **Keep sensitive variables** in environment variables or secrets management
4. **Version control** all Terraform configurations
5. **Document changes** to infrastructure

## References

- [Vercel Terraform Provider Documentation](https://registry.terraform.io/providers/vercel/vercel/latest/docs)
- [Vercel API Documentation](https://vercel.com/docs/rest-api)
- [Terraform Documentation](https://www.terraform.io/docs)