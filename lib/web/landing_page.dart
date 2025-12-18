import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GreywayLandingPage extends StatelessWidget {
  const GreywayLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = const Color(0xff121b22);
    final Color primaryBlue = Colors.blue;
    final Color surfaceColor = const Color(0xff1c2a35);

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNavBar(context, primaryBlue),
            _buildHero(context, primaryBlue),
            _buildProblem(surfaceColor, primaryBlue),
            _buildSolution(surfaceColor, primaryBlue),
            _buildFeatures(surfaceColor, primaryBlue),
            _buildDifferentiators(surfaceColor, primaryBlue),
            _buildPricing(surfaceColor, primaryBlue),
            _buildCaseStudy(surfaceColor, primaryBlue),
            _buildFAQ(surfaceColor, primaryBlue),
            _buildFooter(context, primaryBlue),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBar(BuildContext context, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("GREYWAY.CO", 
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 3, fontSize: 16)),
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text("Features", style: TextStyle(color: Colors.white70))),
              const SizedBox(width: 20),
              TextButton(onPressed: () {}, child: const Text("Pricing", style: TextStyle(color: Colors.white70))),
              const SizedBox(width: 20),
              TextButton(onPressed: () {}, child: const Text("Contact", style: TextStyle(color: Colors.white70))),
              const SizedBox(width: 40),
              ElevatedButton(
                onPressed: () => context.go('/pilot'),
                style: ElevatedButton.styleFrom(backgroundColor: blue),
                child: const Text("REQUEST PILOT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: blue.withAlpha(30),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text("INSTITUTIONAL INFRASTRUCTURE FOR SCHOOLS",
              style: TextStyle(color: Colors.blueAccent, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          ),
          const SizedBox(height: 40),
          const Text("Modern Student Billing\nThat Works Everywhere",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 56, fontWeight: FontWeight.bold, height: 1.1)),
          const SizedBox(height: 28),
          const Text(
            "Fees Up: Offline-first billing infrastructure designed for schools in regions with unreliable connectivity.\nAutomatic sync. Real-time reports. Zero infrastructure headaches.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 18, height: 1.6, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 60),
          SizedBox(
            width: 300,
            height: 60,
            child: ElevatedButton(
              onPressed: () => context.go('/pilot'),
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
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

  Widget _buildProblem(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("The Problem", 
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _problemCard(surface, blue, "Manual Processes", "Paper records, spreadsheets, manual calculations lead to errors and inefficiency."),
              _problemCard(surface, blue, "Internet Dependency", "School billing systems go offline when connectivity is unreliable, grinding operations to a halt."),
              _problemCard(surface, blue, "No Real-Time Visibility", "Finance heads lack instant insight into revenue, collections, and student balances."),
            ],
          ),
        ],
      ),
    );
  }

  Widget _problemCard(Color surface, Color blue, String title, String desc) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(color: surface, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.orangeAccent, size: 32),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          Text(desc, style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.6)),
        ],
      ),
    );
  }

  Widget _buildSolution(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: surface.withAlpha(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("The Solution", 
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          const Text(
            "Fees Up brings institutional-grade billing infrastructure to schools. Offline-first. Real-time sync. Built for schools where reliability is non-negotiable.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 18, height: 1.6),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _solutionCard(surface, blue, "📱 Offline-First", "Work without internet. Sync automatically when connected."),
              _solutionCard(surface, blue, "⚡ Real-Time Sync", "Changes appear instantly on all devices via PowerSync."),
              _solutionCard(surface, blue, "📊 Instant Analytics", "Live revenue dashboards and payment tracking at your fingertips."),
            ],
          ),
        ],
      ),
    );
  }

  Widget _solutionCard(Color surface, Color blue, String icon, String desc) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: blue.withAlpha(60), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 40)),
          const SizedBox(height: 16),
          Text(desc, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildFeatures(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Why Schools Choose Fees Up", 
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(height: 60),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _featureBox(surface, blue, Icons.cloud_off, "Offline Resilience", "Full functionality without internet. Automatic sync when connected."),
              _featureBox(surface, blue, Icons.receipt_long, "Receipt Generation", "Automated receipts with unique reference numbers for every payment."),
              _featureBox(surface, blue, Icons.trending_up, "Revenue Analytics", "Real-time dashboards showing collections, trends, and financial health."),
              _featureBox(surface, blue, Icons.school, "Student Ledger", "Complete payment history and balance tracking per student."),
              _featureBox(surface, blue, Icons.security, "Data Sovereignty", "Encrypted storage. Row-level security. Your data, under your control."),
              _featureBox(surface, blue, Icons.devices, "Multi-Platform", "Android, iOS, Linux, Web. Deploy anywhere."),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featureBox(Color surface, Color blue, IconData icon, String title, String desc) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(color: surface, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: blue, size: 32),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Text(desc, style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.6)),
        ],
      ),
    );
  }

  Widget _buildDifferentiators(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Built for Institutional Authority", 
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text(
            "Not a startup toy. A professional infrastructure system.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _differentiatorCard(blue, "Infrastructure Authority", ["Vetting-based access", "Institutional governance", "Production-grade SLAs"]),
              _differentiatorCard(blue, "Offline-First Design", ["Works without internet", "Zero connectivity friction", "Automatic background sync"]),
              _differentiatorCard(blue, "Institutional Trust", ["Audit-grade ledgers", "Encrypted data storage", "Compliance-ready architecture"]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _differentiatorCard(Color blue, String title, List<String> points) {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xff1c2a35),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: blue.withAlpha(60), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 20),
          ...points.map((p) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Icon(Icons.check_circle, color: blue, size: 18),
                const SizedBox(width: 12),
                Expanded(child: Text(p, style: const TextStyle(color: Colors.white70, fontSize: 14))),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildPricing(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: surface.withAlpha(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Pilot Pricing", 
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text(
            "No payment during pilot. Zero lock-in. Pure evaluation.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _pricingTier("Standard Pilot", "Free", "90 days", ["Up to 500 students", "Full feature access", "Email support", "Data import included"]),
              _pricingTier("Critical Path Pilot", "Free", "90 days + priority review", ["Up to 2000 students", "Full feature access", "Dedicated engineer", "Custom integrations"]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pricingTier(String name, String price, String period, List<String> features) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xff1c2a35),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blue.withAlpha(100), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
          const SizedBox(height: 12),
          Text(price, style: const TextStyle(color: Colors.blueAccent, fontSize: 32, fontWeight: FontWeight.bold)),
          Text(period, style: const TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 32),
          ...features.map((f) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: Colors.greenAccent, size: 18),
                const SizedBox(width: 12),
                Expanded(child: Text(f, style: const TextStyle(color: Colors.white70, fontSize: 14))),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildCaseStudy(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Institutional Impact", 
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(color: surface, borderRadius: BorderRadius.circular(14)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("\"Fees Up eliminated our billing bottleneck.\"",
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, height: 1.4)),
                      const SizedBox(height: 16),
                      const Text(
                        "Before Fees Up, our finance team spent 3 days every week on manual fee collection and reconciliation. With offline-first architecture, we now process payments in real-time, even in remote areas with poor connectivity.\n\nWithin 30 days, our collection rate improved by 24%, and payment processing time dropped by 80%.",
                        style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 24),
                      const Text("Principal, Nairobi International Academy",
                        style: TextStyle(color: Colors.blueAccent, fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xff1c2a35),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _metric(blue, "24%", "Increase in collection rate"),
                      const SizedBox(height: 24),
                      _metric(blue, "80%", "Reduction in processing time"),
                      const SizedBox(height: 24),
                      _metric(blue, "1.2M", "KES recovered in Q1"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _metric(Color blue, String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: TextStyle(color: blue, fontSize: 28, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.4)),
      ],
    );
  }

  Widget _buildFAQ(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: surface.withAlpha(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Frequently Asked", 
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _faqItem(blue, "What is the pilot commitment?", "Zero. It's a 90-day evaluation with no payment and no lock-in. Your data remains yours."),
              _faqItem(blue, "How does offline-first work?", "All data is stored locally on devices. Changes sync to the cloud when internet returns. Users work without any connectivity friction."),
              _faqItem(blue, "Can we integrate with existing systems?", "Yes. We provide APIs for custom integrations. PowerSync handles real-time sync with your infrastructure."),
            ],
          ),
        ],
      ),
    );
  }

  Widget _faqItem(Color blue, String q, String a) {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xff1c2a35),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: blue.withAlpha(40), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(q, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          Text(a, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.6)),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      color: const Color(0xff0f1419),
      child: Column(
        children: [
          const Divider(color: Colors.white10),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("GREYWAY.CO", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 14)),
                  SizedBox(height: 8),
                  Text("© 2025 A Batch Tech Venture", style: TextStyle(color: Colors.white10, fontSize: 11)),
                ],
              ),
              SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => context.go('/pilot'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("REQUEST PILOT ACCESS", 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
