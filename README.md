# greyway_co

Greyway.Co | Fees Up - Institutional Student Billing Infrastructure

## 🚀 Continuous Integration & Deployment

This repository uses GitHub Actions to build **portable** web, Android, and Linux artifacts. All builds work from any root path (localhost, GitHub Pages, or custom domain) with zero reconfiguration.

### Workflow: Build Institutional Artifacts

- **File:** [.github/workflows/build_artifacts.yml](.github/workflows/build_artifacts.yml)
- **Trigger:** Push to `main` or `master`, or manual dispatch
- **Outputs:**
  - 🌐 Web: `greyway-web-portal` (tar.gz, portable)
  - 📱 Android: `greyway-android-release` (APK)
  - 🖥️ Linux: `greyway-linux-release` (tar.gz bundle)

### Required Secrets

Configure these in **GitHub → Settings → Secrets and variables → Actions:**
- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `POWERSYNC_ENDPOINT_URL`

### Deployment Options

#### Option 1: Local Preview (Development)

Download the `greyway-web-portal` artifact from the latest workflow run:

```bash
# Extract the artifact
mkdir -p ~/Downloads/greyway-web
tar -xzvf greyway-web-portal.tar.gz -C ~/Downloads/greyway-web

# Serve locally (any static server works)
cd ~/Downloads/greyway-web
python3 -m http.server 8080
# or: http-server . -p 8081

# Open browser: http://localhost:8080
```

#### Option 2: GitHub Pages (Automatic)

On push to `main`, the workflow automatically:
1. Builds the web portal with `--base-href=/` (portable)
2. Deploys to GitHub Pages

**Live Site:** https://gabrielle247.github.io/greyway_co/

_Note: One-time setup: **Settings → Pages → Source** = **GitHub Actions**._

#### Option 3: Custom Domain / VPS

1. Download `greyway-web-portal` artifact
2. Extract to your web server:
```bash
tar -xzvf greyway-web-portal.tar.gz -C /var/www/greyway/
```
3. Configure nginx/Apache to serve the directory as root
4. The app works from any domain or path (portable by design)

### Local Build (Without CI)

For development on your HP Notebook:

```bash
flutter config --enable-web
flutter pub get
flutter build web --release --base-href /
cd build/web
python3 -m http.server 8080
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
