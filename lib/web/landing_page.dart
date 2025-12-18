import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GreywayLandingPage extends StatelessWidget {
  const GreywayLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Greyway.Co Institutional Theme
    final Color bgColor = const Color(0xff121b22);
    final Color primaryBlue = Colors.blue;
    final Color surfaceColor = const Color(0xff1c2a35);

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- NAV BAR ---
            _buildNavBar(context),

            // --- HERO SECTION ---
            _buildHero(context, primaryBlue),

            // --- ELIGIBILITY GATES ---
            _buildEligibility(surfaceColor, primaryBlue),

            // --- PILOT EXPECTATIONS ---
            _buildPilotExpectations(surfaceColor, primaryBlue),

            // --- VALUE PROPOSITION ---
            _buildFeatures(context, surfaceColor, primaryBlue),

            // --- FOOTER ---
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("GREYWAY.CO", 
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 3)),
          ElevatedButton(
            onPressed: () => context.go('/pilot'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text("APPLY FOR PILOT", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context, Color primaryBlue) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: primaryBlue.withAlpha(30),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text("OFFLINE-FIRST EDUCATION INFRASTRUCTURE",
              style: TextStyle(color: Colors.blueAccent, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
          ),
          const SizedBox(height: 32),
          const Text("Modern Student Billing\nfor the Modern Institution",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold, height: 1.1)),
          const SizedBox(height: 24),
          const Text(
            "Fees Up provides automated billing, payment tracking, and real-time ledger management.\nDesigned for schools where reliability is non-negotiable.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 18, height: 1.5),
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: 250,
            height: 60,
            child: ElevatedButton(
              onPressed: () => context.go('/pilot'),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("START PILOT APPLICATION", 
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatures(BuildContext context, Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Wrap(
        spacing: 30,
        runSpacing: 30,
        alignment: WrapAlignment.center,
        children: [
          _featureCard(Icons.cloud_off, "Offline Resilience", "Operate without internet. Sync automatically when back online.", surface, blue),
          _featureCard(Icons.account_balance, "Audit Ready", "Complete ledger history for every student and transaction.", surface, blue),
          _featureCard(Icons.security, "Data Sovereignty", "Institutional data secured with Greyway.Co high-encryption standards.", surface, blue),
        ],
      ),
    );
  }

  Widget _featureCard(IconData icon, String title, String desc, Color bg, Color accent) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: accent, size: 32),
          const SizedBox(height: 20),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          Text(desc, style: const TextStyle(color: Colors.white54, fontSize: 14, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      child: Column(
        children: [
          const Divider(color: Colors.white10),
          const SizedBox(height: 40),
          const Text("GREYWAY.CO", style: TextStyle(color: Colors.white24, letterSpacing: 5, fontSize: 12)),
          const SizedBox(height: 8),
          const Text("© 2025 • A Batch Tech Venture", style: TextStyle(color: Colors.white10, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildEligibility(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(color: blue.withAlpha(30), borderRadius: BorderRadius.circular(12)),
            child: const Text("ELIGIBILITY GATE", style: TextStyle(color: Colors.blueAccent, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
          ),
          const SizedBox(height: 18),
          const Text("Who We Deploy For", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold, height: 1.2)),
          const SizedBox(height: 14),
          const Text(
            "Greyway.Co selects institutions with operational discipline. Review the criteria before requesting a pilot.",
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _eligibilityCard(surface, blue, "Designed For", const [
                "Registered schools with audited financial oversight",
                "Teams that manage recurring student fees",
                "Sites operating through unstable connectivity",
              ]),
              _eligibilityCard(surface, blue, "Not Designed For", const [
                "Individual tutors or informal groups",
                "Schools unwilling to migrate records",
                "Institutions lacking governance authority",
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPilotExpectations(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(color: blue.withAlpha(30), borderRadius: BorderRadius.circular(12)),
            child: const Text("PILOT EXPECTATIONS", style: TextStyle(color: Colors.blueAccent, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
          ),
          const SizedBox(height: 18),
          const Text("What the Pilot Includes", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold, height: 1.2)),
          const SizedBox(height: 14),
          const Text(
            "90-day controlled deployment with read-only import of existing records, no lock-in, no payment during pilot.",
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _phaseCard(surface, blue, "What We Provide", const [
                "Offline-first data capture + sync pipeline",
                "Dedicated onboarding engineer",
                "Audit-grade ledger visibility for finance heads",
              ]),
              _phaseCard(surface, blue, "What We Do Not Require", const [
                "No payment during pilot",
                "No destructive writes to your source systems",
                "No public commitment until rollout decision",
              ]),
              _phaseCard(surface, blue, "Process Roadmap", const [
                "Phase 0 – Application Review",
                "Phase 1 – Infrastructure Fit Assessment",
                "Phase 2 – Pilot Deployment",
                "Phase 3 – Decision & Rollout",
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _eligibilityCard(Color surface, Color blue, String title, List<String> bullets) {
    return Container(
      width: 380,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: surface, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          ...bullets.map((b) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle, color: blue, size: 18),
                    const SizedBox(width: 10),
                    Expanded(child: Text(b, style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.4))),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _phaseCard(Color surface, Color blue, String title, List<String> bullets) {
    return Container(
      width: 380,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: surface, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          ...bullets.map((b) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.bolt, color: blue, size: 18),
                    const SizedBox(width: 10),
                    Expanded(child: Text(b, style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.4))),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}