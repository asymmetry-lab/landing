# Asymmetry Lab Landing Page

Research-driven product studio exploiting market inefficiencies, building micro‑products, and discovering hidden opportunities others miss.

## Overview

This is a static landing page for Asymmetry Lab, featuring:
- Modern, responsive design with dark theme
- Animated gradient text and interactive cards
- Intellectual, research‑driven tone reflecting our focus on market asymmetries
- Optimized for performance and SEO

## Project Structure

```
.
├── index.html              # Main landing page
├── logo-simple.jpg         # Simple logo (header & favicon)
├── logo-complex.jpg        # Complex logo (hero visual)
├── package.json           # Project metadata
├── vercel.json            # Vercel deployment configuration
├── .gitignore             # Git ignore rules
├── .vercelignore          # Vercel ignore rules
├── README.md              # This file
└── devops/
    └── terraform/         # Infrastructure as Code (Terraform)
        ├── main.tf        # Main Terraform configuration
        ├── variables.tf   # Variable definitions
        ├── outputs.tf     # Output values
        ├── provider.tf    # Provider configuration
        └── README.md      # Terraform documentation
```

## Git Setup (for GitHub Repository)

```bash
# Initialize git repository
git init

# Add all files
git add .

# Initial commit
git commit -m "Initial commit: Asymmetry Lab landing page"

# Add remote repository (replace with your GitHub repo URL)
git remote add origin https://github.com/asymmetrylab/landing.git

# Push to main branch
git push -u origin main
```

## Local Development

No build process required. Simply open `index.html` in a browser:

```bash
# Open directly in browser
open index.html
# or
firefox index.html
# or
chrome index.html
```

For live reload during development, you can use a simple HTTP server:

```bash
# Using Python
python3 -m http.server 3000

# Using Node.js with http-server
npx http-server -p 3000
```

Then visit `http://localhost:3000`

## Deployment

This project is configured for automatic deployment via [Vercel](https://vercel.com).

### Automatic Deployment (Recommended)

1. **Push to GitHub**: Connect your GitHub repository to Vercel
2. **Vercel will automatically detect** the static site and deploy
3. **Custom domain**: Configure `asymmetrylab.com` in Vercel project settings

### Manual Deployment

1. **Install Vercel CLI** (if not installed):
   ```bash
   npm i -g vercel
   ```

2. **Deploy**:
   ```bash
   vercel
   ```

3. **Production deploy**:
   ```bash
   vercel --prod
   ```

### Environment Variables

No environment variables required for this static site.

## Vercel Configuration

The `vercel.json` file contains:
- **Alias**: `asymmetrylab.com` (custom domain)
- **Regions**: `iad1` (US East)
- **Public**: `true` (publicly accessible)

## Custom Domain Setup

1. **In Vercel Dashboard**:
   - Go to Project → Settings → Domains
   - Add `asymmetrylab.com`

2. **DNS Configuration**:
   - Add Vercel's DNS records to your domain registrar
   - Typically A/AAAA records or CNAME to `cname.vercel-dns.com`

## Infrastructure (Optional)

For infrastructure-as-code, Terraform configuration is available in `devops/terraform/`.

### Setting up Terraform

```bash
cd devops/terraform
terraform init
terraform plan
terraform apply
```

This creates:
- Vercel project configuration
- Custom domain setup
- Environment variables (if any)

## Maintenance

### Updating Content

1. Edit `index.html` directly
2. Commit and push changes
3. Vercel will automatically redeploy

### Adding Images

1. Place new images in project root
2. Reference them in HTML with relative paths
3. Vercel will serve them as static assets

### SEO Optimization

- Open Graph tags are already configured in `<head>`
- Update `og:image` if logo changes
- Update `og:description` for significant content changes

## Performance

- No JavaScript frameworks (vanilla JS only)
- Inline CSS for critical styles
- Optimized images (JPEG format)
- Lazy loading considerations for future image additions

## Browser Support

- Modern browsers (Chrome ≥80, Firefox ≥75, Safari ≥14, Edge ≥80)
- Responsive design for mobile, tablet, and desktop
- Progressive enhancement approach

## License

UNLICENSED - Proprietary to Asymmetry Lab.

---

**Asymmetry Lab** – Exploiting Market Inefficiencies · Products Built on Small Advantages · Discovering What Others Miss