# Greyway.Co - Fees Up Product Site

A professional Flutter web product marketing site for **Fees Up**, an offline-first school billing and management system.

## 🎯 What This Is

This is the **public-facing product marketing website** for Fees Up—not the backend application. It serves as:
- **Landing page** with institutional positioning
- **Product features showcase**
- **Pricing & pilot information**
- **Case studies & testimonials**
- **Pilot application intake** (to qualified schools)

## 🚀 Live Deployment

**Product Site:** https://gabrielle247.github.io/greyway_co/

Automatically deployed on every push to `main` via GitHub Actions.

## 🏗 Architecture

```
greyway_co/
├── lib/
│   ├── main.dart                 # App entry, Supabase + routing setup
│   ├── config/
│   │   └── secrets.dart         # Environment variable loader
│   └── web/
│       ├── landing_page.dart    # Complete product marketing site
│       └── pilot_wizard.dart    # Institutional pilot application intake
├── .github/workflows/
│   └── build_artifacts.yml      # CI/CD for web + mobile builds
└── .env                          # Secrets (gitignored)
```

## 🔑 Key Pages

### 1. **Landing Page** (`/`)
- Hero section with value proposition
- Problem statement (3 pain points)
- Solution overview
- 6 feature boxes
- Institutional authority positioning
- Pilot pricing tiers
- Case study/testimonial with metrics
- FAQ section
- Navigation to pilot wizard

### 2. **Pilot Wizard** (`/pilot`)
- Multi-step institutional intake form
- Form validation (TextFormField-based)
- Authorization gating
- Writes to Supabase `school_applications` table
- Success confirmation screen with Application ID
- Portable to any server (--base-href=/)

## 🛠 Tech Stack

- **Flutter 3.27+** - Cross-platform UI
- **Dart 3.6+** - Language
- **GoRouter 17+** - Navigation
- **Supabase 2.12+** - Backend (write-only intake table)
- **flutter_dotenv 5.2+** - Secrets management

## 📦 Setup

### 1. Prerequisites
```bash
flutter --version  # Must be 3.27+
flutter config --enable-web
```

### 2. Environment
```bash
cp .env.example .env
```

Add your credentials:
```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
POWERSYNC_ENDPOINT_URL=https://your-instance.powersync.journeyapps.com
```

### 3. Install & Run
```bash
flutter pub get
flutter run -d chrome --web-port=8080
```

## 🌐 Deployment

### GitHub Pages (Automatic)
Every push to `main` triggers:
1. Build with `--base-href=/greyway_co/`
2. Upload web artifact
3. Deploy to Pages

**Site:** https://gabrielle247.github.io/greyway_co/

### Local Deployment
```bash
flutter build web --release --base-href=/
cd build/web
python3 -m http.server 8080
# Open http://localhost:8080
```

### Custom Domain/VPS
```bash
# Download artifact from Actions
tar -xzvf greyway-web-portal.tar.gz -C /var/www/greyway/
# Configure nginx/Apache to serve the directory as root
# Works from any domain or path (portable)
```

## 🔐 Secrets Management

### GitHub Actions
Set in **Settings → Secrets and variables → Actions:**
- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `POWERSYNC_ENDPOINT_URL`

Passed to build as `--dart-define` flags.

### Local Development
Load from `.env` via `flutter_dotenv`. 

**Note:** `.env` is gitignored and never committed.

## 📊 Database Schema (Supabase)

### `school_applications` (Write-Only)
```sql
id, school_name, school_type, student_count_range, 
current_system, requires_offline, applicant_name, 
applicant_role, contact_email, contact_phone, 
authorized_submission, eligibility_tier, 
submitted_at, created_at, updated_at
```

**RLS Policy:** Insert-only. Clients cannot select/update/delete.

## ✅ Features

### Landing Page
- [x] Institutional positioning
- [x] Problem/solution narrative
- [x] 6 feature boxes
- [x] Pricing tiers
- [x] Case study with metrics
- [x] FAQ section
- [x] Navigation menu

### Pilot Intake Wizard
- [x] 6-step form (readiness → institution → capacity → infrastructure → applicant → legal)
- [x] Form validation (TextFormField)
- [x] Authorization gating
- [x] Supabase write integration
- [x] Success confirmation with Application ID

### CI/CD
- [x] GitHub Actions web build
- [x] Multi-platform artifacts (Android, Linux)
- [x] GitHub Pages auto-deploy
- [x] Portable web bundle (--base-href=/)
- [x] Environment secrets injection

## 🧪 Testing

```bash
# Analyze code
flutter analyze

# Test local build
flutter run -d chrome

# Build for production
flutter build web --release --base-href=/

# Serve locally
cd build/web
python3 -m http.server 8080
```

## 📚 Documentation

- **GitHub Actions:** [.github/workflows/build_artifacts.yml](.github/workflows/build_artifacts.yml)
- **Supabase Schema:** [supabase/schema.sql](supabase/schema.sql)
- **Secrets Config:** [lib/config/secrets.dart](lib/config/secrets.dart)

## 🚀 Next Steps

- Add form submission email notifications
- Track pilot applications in admin dashboard
- A/B test landing page headlines
- Add customer testimonial videos
- Implement contact form
- Set up analytics (Google Analytics / Mixpanel)

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/gabrielle247/greyway_co/issues)
- **Deployments:** Check [GitHub Actions](https://github.com/gabrielle247/greyway_co/actions)

## 📄 License

MIT License © 2025 Batch Tech Venture

---

**Made with ❤️ using Flutter**
