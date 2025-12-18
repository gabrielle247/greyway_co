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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "🏛️ GREYWAY CO",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "INSTITUTIONAL INFRASTRUCTURE",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 9,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => context.go('/about'),
                child: const Text(
                  "Partnership",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Infrastructure",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () => context.go('/pilot'),
                child: const Text(
                  "Assessment",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(width: 40),
              ElevatedButton(
                onPressed: () => context.go('/pilot'),
                style: ElevatedButton.styleFrom(backgroundColor: blue),
                child: const Text(
                  "INSTITUTIONAL ASSESSMENT",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
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
            child: const Text(
              "BORN IN ZIMBABWE, BUILT FOR THE WORLD",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "Offline-First Billing for\nTeachers, Tutors & Schools",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 56,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            "Fees Up was born at KwaLegend Academy in Harare to solve a teacher's billing problem.\nNow it helps teachers with extra lessons (0-10 students), tutoring centers, and schools across Zimbabwe.\nFree for individuals. Trial for schools. Works offline. Syncs when connected.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              height: 1.6,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Conceptualized by Nyasha Gabriel & Sir Legend (Teacher, KwaLegend Academy)",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white38,
              fontSize: 12,
              fontStyle: FontStyle.italic,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            width: 300,
            height: 60,
            child: ElevatedButton(
              onPressed: () => context.go('/pilot'),
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "START FREE / TRY SCHOOL TRIAL",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
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
          const Text(
            "The Institutional Gap",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Schools face operational fragility where foundational infrastructure should exist",
            style: TextStyle(
              color: Colors.white60,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _problemCard(
                surface,
                blue,
                "Fragmented Systems",
                "Manual ledgers and disconnected spreadsheets compromise audit readiness and institutional accountability.",
              ),
              _problemCard(
                surface,
                blue,
                "Infrastructure Dependency",
                "Legacy systems fail during connectivity lapses, creating operational paralysis when schools need resilience.",
              ),
              _problemCard(
                surface,
                blue,
                "Decision Latency",
                "Leadership lacks real-time operational capacity data to make informed financial governance decisions.",
              ),
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
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.orangeAccent,
            size: 32,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.6,
            ),
          ),
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
          const Text(
            "The Infrastructure Deployment",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "Greyway Co deploys Fees Up as foundational infrastructure—not a tool, but a decision system. Offline-resilient architecture. Real-time institutional data sovereignty. Built for schools where operational continuity is non-negotiable.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 18, height: 1.6),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _solutionCard(
                surface,
                blue,
                "🛡️ Resilience-First",
                "Operational continuity without infrastructure dependency. Automatic synchronization when connected.",
              ),
              _solutionCard(
                surface,
                blue,
                "⚡ Institutional Sync",
                "PowerSync-backed real-time data propagation across all authorized deployment endpoints.",
              ),
              _solutionCard(
                surface,
                blue,
                "📊 Decision Intelligence",
                "Live operational capacity dashboards with audit-ready financial governance visibility.",
              ),
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
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.5,
            ),
          ),
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
          const Text(
            "Infrastructure Capabilities",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Built for institutions where operational continuity is non-negotiable",
            style: TextStyle(
              color: Colors.white60,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _featureBox(
                surface,
                blue,
                Icons.cloud_off,
                "Resilient Architecture",
                "Zero connectivity dependency. Full operational capacity offline with automatic synchronization on reconnection.",
              ),
              _featureBox(
                surface,
                blue,
                Icons.receipt_long,
                "Audit-Ready Documentation",
                "Automated receipt generation with cryptographically unique transaction references for institutional compliance.",
              ),
              _featureBox(
                surface,
                blue,
                Icons.trending_up,
                "Decision Intelligence",
                "Real-time operational dashboards with financial governance visibility and institutional capacity tracking.",
              ),
              _featureBox(
                surface,
                blue,
                Icons.school,
                "Student Financial Registry",
                "Complete institutional ledger with comprehensive payment history and balance sovereignty per student account.",
              ),
              _featureBox(
                surface,
                blue,
                Icons.security,
                "Data Sovereignty",
                "End-to-end encryption. Row-level security policies. Institutional data remains under institutional control.",
              ),
              _featureBox(
                surface,
                blue,
                Icons.devices,
                "Cross-Platform Deployment",
                "Android, iOS, Linux, Web infrastructure. Deploy across any institutional endpoint configuration.",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featureBox(
    Color surface,
    Color blue,
    IconData icon,
    String title,
    String desc,
  ) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: blue, size: 32),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.6,
            ),
          ),
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
          const Text(
            "The Greyway Co Advantage",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Infrastructure deployment partners—not software vendors. Authority over convenience.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _differentiatorCard(blue, "Institutional Vetting", [
                "Eligibility-based deployment",
                "Operational readiness assessment",
                "Infrastructure governance SLAs",
              ]),
              _differentiatorCard(blue, "Resilience Architecture", [
                "Connectivity-independent operation",
                "Zero infrastructure dependency",
                "Automated bidirectional sync",
              ]),
              _differentiatorCard(blue, "Institutional Sovereignty", [
                "Audit-ready financial ledgers",
                "End-to-end encryption",
                "Compliance-first architecture",
              ]),
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
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          ...points.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: blue, size: 18),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      p,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
          const Text(
            "Pricing",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Free for individual teachers and tutors. Schools get a 1-month trial with full features.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _pricingTier(
                "Individual (Free Forever)",
                "Free",
                "For teachers & tutors",
                [
                  "0-10 students",
                  "Offline-first billing",
                  "Real-time sync",
                  "Receipt generation",
                  "Perfect for extra lessons",
                ],
              ),
              _pricingTier("School Trial", "Free", "1 month full access", [
                "Unlimited students",
                "All premium features",
                "Multi-device sync",
                "After trial: Limited support & usage",
                "Zimbabwe schools prioritized",
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pricingTier(
    String name,
    String price,
    String period,
    List<String> features,
  ) {
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
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            price,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            period,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 32),
          ...features.map(
            (f) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check, color: Colors.greenAccent, size: 18),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      f,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
          const Text(
            "Deployment Case Study",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "\"Infrastructure that doesn't fail when connectivity does.\"",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Prior to Greyway Co deployment, our institutional finance operations required 3 days per week for manual reconciliation—a fragility we couldn't sustain. Fees Up infrastructure eliminated connectivity-dependent operational paralysis.\n\nPost-deployment metrics: 24% improvement in collection operational capacity, 80% reduction in transaction processing latency, 1.2M KES in recovered institutional revenue within 90 days.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Finance Director, Nairobi International Academy",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
        Text(
          value,
          style: TextStyle(
            color: blue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            height: 1.4,
          ),
        ),
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
          const Text(
            "Institutional Onboarding Questions",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _faqItem(
                blue,
                "How does eligibility assessment work?",
                "Greyway Co evaluates operational readiness, infrastructure capacity, and institutional governance. Institutions are selected based on alignment with deployment requirements—not on a first-come basis.",
              ),
              _faqItem(
                blue,
                "What is the vetting process?",
                "Submit an institutional assessment. Our team reviews operational capacity, connectivity challenges, and administrative readiness. Selected institutions receive a deployment timeline within 5 business days.",
              ),
              _faqItem(
                blue,
                "What happens during the deployment phase?",
                "Zero financial commitment. 90-day infrastructure deployment with full operational support. Your institution maintains complete data sovereignty throughout the evaluation.",
              ),
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
          Text(
            q,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            a,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              height: 1.6,
            ),
          ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "🏛️ GREYWAY CO",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "INSTITUTIONAL INFRASTRUCTURE PARTNER",
                    style: TextStyle(
                      color: Colors.white24,
                      fontSize: 9,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Conceptualized by Nyasha Gabriel & Sir Legend (Teacher, KwaLegend Academy, Harare)",
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Born at KwaLegend Academy, Zimbabwe | Sir Legend holds 30% equity",
                    style: TextStyle(color: Colors.white24, fontSize: 10),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "© 2025 Greyway Co (Formerly Batch Tech Venture)",
                    style: TextStyle(color: Colors.white10, fontSize: 11),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Built for Zimbabwe teachers, tutors, and schools",
                    style: TextStyle(color: Colors.white10, fontSize: 10),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 280,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () => context.go('/pilot'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "START FREE / TRY SCHOOL TRIAL",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Gateway to the Modern School",
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
