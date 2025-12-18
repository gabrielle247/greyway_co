# 🏛️ Greyway Co - Institutional Infrastructure Gateway

The official institutional portal for **Fees Up**—foundational infrastructure for school data sovereignty and financial resilience. This is not the backend application; it is the **Gateway to the Modern School**.

## 🎯 What This Is

This is the **institutional infrastructure briefing and assessment portal** for Fees Up. It serves as:
- **Infrastructure positioning** - Authority over convenience
- **Decision system showcase** - Not a tool, but infrastructure
- **Eligibility vetting gate** - Institutions are selected based on operational readiness
- **Deployment case studies** - Institutional impact metrics
- **Assessment intake** - Formal institutional onboarding process

### 🤝 Partnership & Attribution

**Conceptualized by Nyasha Gabriel & Sir Legend (KwaLegend)**

- **Lead Architect**: Nyasha Gabriel
- **Strategic Partner**: Sir Legend (30% equity stake)
- **Original Visionary**: Sir Legend contributed the foundational idea and marketing strategy
- **Development Sponsor**: KwaLegend sponsors data and testing infrastructure
- **Corporate Identity**: Greyway Co (formerly Batch Tech Venture)

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

## 🔑 Key Infrastructure Components

### 1. **Institutional Landing Gateway** (`/`)
- Hero: "Gateway to the Modern School" positioning
- The Institutional Gap (3 operational fragilities)
- Infrastructure Deployment overview
- 6 capability modules (resilient architecture, audit-ready docs, decision intelligence)
- The Greyway Co Advantage (vetting, resilience, sovereignty)
- Institutional Onboarding (not "pricing"—assessment tiers)
- Deployment case study with institutional metrics
- Institutional onboarding FAQ
- Full attribution footer (Nyasha Gabriel & Sir Legend)

### 2. **Eligibility Assessment Wizard** (`/pilot`)
- Multi-step institutional vetting form
- Form validation (TextFormField-based)
- Authorization gating
- Writes to Supabase `school_applications` table
- Success confirmation screen with Application ID
- Portable to any server (--base-href=/)

## 🛠 Infrastructure Stack

- **Flutter 3.27+** - Cross-platform institutional portal framework
- **Dart 3.6+** - Type-safe infrastructure language
- **GoRouter 17+** - Gateway routing architecture
- **Supabase 2.12+** - Write-only institutional assessment registry
- **flutter_dotenv 5.2+** - Infrastructure secrets management
- **PowerSync** - Real-time bidirectional synchronization (referenced in product positioning)

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

## ✅ Infrastructure Capabilities

### Institutional Gateway (Landing)
- [x] Authority positioning - "Gateway to the Modern School"
- [x] Institutional gap narrative (operational fragilities)
- [x] Infrastructure deployment showcase (6 capabilities)
- [x] Institutional onboarding tiers (not "pricing"—vetting-based)
- [x] Deployment case study with institutional metrics
- [x] Institutional onboarding FAQ
- [x] Full partnership attribution (Nyasha Gabriel & Sir Legend)
- [x] Navigation to assessment intake

### Eligibility Assessment System
- [x] 6-phase institutional readiness form
- [x] Hard validation (GlobalKey<FormState>, TextFormField)
- [x] Legal authorization checkpoint
- [x] Write-only Supabase registry integration
- [x] Application ID generation (timestamp-based)
- [x] Bidirectional navigation (Previous/Next)

### Infrastructure Deployment (CI/CD)
- [x] GitHub Actions portable web build
- [x] Multi-platform artifacts (Android APK, Linux executable)
- [x] Automatic GitHub Pages deployment
- [x] Portable web bundle (`--base-href=/`)
- [x] Secrets injection via `--dart-define` flags

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

## 🚀 Institutional Roadmap

### Phase 0: Assessment (Current)
- [x] Eligibility vetting gate deployed
- [x] Institutional assessment intake
- [ ] Assessment notification system (email to Greyway Co operations)
- [ ] Admin dashboard for institutional review queue

### Phase 1: Deployment Enhancements
- [ ] Institutional testimonial video library
- [ ] Enhanced case study repository
- [ ] Partnership acknowledgment page (Nyasha Gabriel & Sir Legend detailed history)
- [ ] Integration showcase (PowerSync, Supabase architecture)

### Phase 2: Operational Intelligence
- [ ] Assessment analytics dashboard
- [ ] A/B testing for institutional messaging
- [ ] Contact/support infrastructure for selected institutions

## 📞 Institutional Support

- **Assessment Inquiries:** [GitHub Issues](https://github.com/gabrielle247/greyway_co/issues)
- **Deployment Status:** Check [GitHub Actions](https://github.com/gabrielle247/greyway_co/actions)
- **Partnership Inquiries:** Contact Nyasha Gabriel or Sir Legend (KwaLegend)

## 📄 Corporate Governance

**Greyway Co** (Formerly Batch Tech Venture)

- **Lead Architect**: Nyasha Gabriel
- **Strategic Partner**: Sir Legend (KwaLegend) - 30% equity stake
- **Development Sponsor**: KwaLegend

**License**: MIT License © 2025 Greyway Co

---

**🏛️ Gateway to the Modern School**  
*Conceptualized by Nyasha Gabriel & Sir Legend (KwaLegend)*
