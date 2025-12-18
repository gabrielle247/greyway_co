import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:greyway_co/config/secrets.dart';
import 'package:greyway_co/web/landing_page.dart';
import 'package:greyway_co/web/pilot_wizard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Note: Ensure your local files are named correctly for these imports
// import 'package:greyway_co/landing_page.dart'; 
// import 'package:greyway_co/pilot_wizard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load environment before boot so Supabase and downstream clients can read it.
  await dotenv.load();

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

/// The main entry point for the Greyway.Co Institutional Site
class GreywayWebsite extends StatelessWidget {
  const GreywayWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Greyway.Co | Education Infrastructure',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      // Institutional Dark Blue Theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff121b22),
        primaryColor: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.blueAccent,
          surface: Color(0xff1c2a35),
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

/// Router configuration separating the Landing Page from the Intake Wizard
final GoRouter _webRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const GreywayLandingPage(),
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