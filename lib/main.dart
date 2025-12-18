import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:greyway_co/config/secrets.dart';
import 'package:greyway_co/web/about_page.dart';
import 'package:greyway_co/web/landing_page.dart';
import 'package:greyway_co/web/pilot_wizard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Note: Ensure your local files are named correctly for these imports
// import 'package:greyway_co/landing_page.dart';
// import 'package:greyway_co/pilot_wizard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load environment before boot so Supabase and downstream clients can read it.
  // In production (web build), secrets are injected via --dart-define.
  // In local development, we try to load from .env asset.
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    // .env not found in debug mode is okay; secrets may come from --dart-define
    debugPrint(
      'Warning: .env file not found. Secrets must be provided via --dart-define or environment.',
    );
  }

  // Touch Secrets to fail fast if required keys are absent.
  Secrets.supabaseUrl;
  Secrets.supabaseAnonKey;

  // Initialize Supabase so the wizard can persist assessments immediately.
  await Supabase.initialize(
    url: Secrets.supabaseUrl,
    anonKey: Secrets.supabaseAnonKey,
  );

  runApp(const GreywayWebsite());
}

/// The main entry point for the Greyway Co Institutional Infrastructure Gateway
class GreywayWebsite extends StatelessWidget {
  const GreywayWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '🏛️ Greyway Co | Gateway to the Modern School',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      // Greyway Co Institutional Dark Blue Theme (Per Infrastructure Briefing)
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(
          0xff121b22,
        ), // Institutional Dark Blue
        primaryColor: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Poppins', // Required by Greyway Co branding standards
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.blueAccent,
          surface: Color(0xff1c2a35), // Surface Color per spec
          onSurface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff121b22),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      routerConfig: _webRouter,
    );
  }
}

/// Router configuration for Greyway Co Institutional Infrastructure Gateway
final GoRouter _webRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const GreywayLandingPage(),
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: '/pilot',
      name: 'pilot',
      builder: (context, state) => const SchoolApplicationWizard(),
    ),
  ],
);

// --- PLACEHOLDER CLASSES ---
// Replace these with your actual file contents if they are in separate files
