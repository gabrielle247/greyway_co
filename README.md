# greyway_co

A new Flutter project.

## CI: Web Build (GitHub Actions)

This repository builds the Flutter web bundle on every push/PR to `main` using GitHub Actions.

- Workflow: [.github/workflows/web-build.yml](.github/workflows/web-build.yml)
- Badge: ![Web Build](https://github.com/gabrielle247/greyway_co/actions/workflows/web-build.yml/badge.svg?branch=main)
- Secrets required (configured in repo settings): `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `POWERSYNC_ENDPOINT_URL`

### Downloading the web artifact

1. Go to Actions → Web Build → select the latest run on `main`.
2. Under Artifacts, download `greyway-web-build`.
3. Unzip and serve `build/web` with any static server.

Local preview example:

```bash
flutter config --enable-web
flutter pub get
flutter build web --release \
  --dart-define=SUPABASE_URL=$SUPABASE_URL \
  --dart-define=SUPABASE_ANON_KEY=$SUPABASE_ANON_KEY \
  --dart-define=POWERSYNC_ENDPOINT_URL=$POWERSYNC_ENDPOINT_URL
cd build/web
python3 -m http.server 8080
# open http://localhost:8080
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
