import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
            _buildHero(primaryBlue),
            _buildOriginStory(surfaceColor, primaryBlue),
            _buildFounders(surfaceColor, primaryBlue),
            _buildPartnership(surfaceColor, primaryBlue),
            _buildMission(surfaceColor, primaryBlue),
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
          GestureDetector(
            onTap: () => context.go('/'),
            child: const Column(
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
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => context.go('/'),
                child: const Text(
                  "Home",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "About",
                  style: TextStyle(color: Colors.white),
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
                  "BEGIN ASSESSMENT",
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

  Widget _buildHero(Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
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
              "ABOUT GREYWAY CO",
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
            "Infrastructure Partnership\nBuilt on Institutional Trust",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 52,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            "Born at Kwalegend Academy in Harare, Zimbabwe. Built for teachers, extra lessons instructors, and schools.\nConceptualized by Nyasha Gabriel & Sir Legend (Teacher at KwaLegend Academy).",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              height: 1.6,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOriginStory(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: surface.withAlpha(80),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The Origin",
                  style: TextStyle(
                    color: blue,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "How Fees Up Became Infrastructure",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Fees Up was born from a real classroom need at KwaLegend Academy in Harare, Zimbabwe. Sir Legend, a teacher managing extra lessons and student billing, faced a daily challenge: tracking fees manually while internet connectivity was unreliable.\n\n"
                  "He approached Nyasha Gabriel with a simple request: build something that works offline and syncs when connected. After completing the first prototype for KwaLegend Academy, they realized the solution could help thousands of teachers and schools across Zimbabwe—and beyond.\n\n"
                  "The vision expanded: make it an open gateway for individual teachers running extra lessons (0-10 students), tutoring centers, and full schools. Free for individuals. Trial-based for institutions. Built for Zimbabwe, scalable globally.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 60),
          Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: blue.withAlpha(60), width: 2),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    color: blue.withAlpha(180),
                    size: 80,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "The Founding Idea",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "\"Build something that works offline, syncs when connected, and helps teachers like me manage fees without the headache\"",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "— Sir Legend",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
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

  Widget _buildFounders(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "The Founders",
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
              _founderCard(
                surface,
                blue,
                "Nyasha Gabriel",
                "Lead Architect & Developer",
                "Software engineer and primary architect of Fees Up. Transformed Sir Legend's classroom need into a scalable offline-first billing system. Responsible for technical implementation, architecture design, and ongoing development of the platform.",
                [
                  "System Architecture & Development",
                  "Offline-First Infrastructure",
                  "Real-Time Sync Implementation",
                  "Platform Scalability",
                ],
              ),
              _founderCard(
                surface,
                blue,
                "Sir Legend",
                "Teacher & Co-Founder (KwaLegend Academy, Harare)",
                "Teacher at KwaLegend Academy in Harare, Zimbabwe. Original visionary who identified the need for offline billing while managing extra lessons. Holds 30% equity stake. Provides real-world testing, teacher insights, and marketing strategy from the classroom perspective.",
                [
                  "Original Problem Identifier",
                  "Classroom Testing & Feedback",
                  "Teacher/Tutor Use Case Design",
                  "Zimbabwe Market Strategy",
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _founderCard(
    Color surface,
    Color blue,
    String name,
    String title,
    String bio,
    List<String> contributions,
  ) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: blue.withAlpha(80), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: blue.withAlpha(40),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                name.substring(0, 2).toUpperCase(),
                style: TextStyle(
                  color: blue,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: blue,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            bio,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Key Contributions:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...contributions.map(
            (c) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: blue, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      c,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
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

  Widget _buildPartnership(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: surface.withAlpha(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "The Partnership Structure",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _partnershipCard(surface, blue, "Equity Distribution", [
                "Nyasha Gabriel: Lead Architect (70%)",
                "Sir Legend (KwaLegend): Strategic Partner (30%)",
                "Formal co-ownership structure",
                "Shared decision-making on strategic direction",
              ]),
              _partnershipCard(surface, blue, "Operational Roles", [
                "Technical Architecture: Nyasha Gabriel",
                "Marketing Strategy: Sir Legend",
                "Development Sponsorship: KwaLegend",
                "Infrastructure Partnerships: Joint oversight",
              ]),
              _partnershipCard(surface, blue, "Legacy & Attribution", [
                "Original idea: Sir Legend contribution",
                "Open gateway concept: KwaLegend vision",
                "All portals acknowledge partnership",
                "Public attribution on institutional materials",
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _partnershipCard(
    Color surface,
    Color blue,
    String title,
    List<String> points,
  ) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ...points.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_forward, color: blue, size: 16),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      p,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.5,
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

  Widget _buildMission(Color surface, Color blue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Our Mission",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: blue.withAlpha(100), width: 2),
            ),
            child: Column(
              children: [
                Icon(Icons.corporate_fare, color: blue, size: 64),
                const SizedBox(height: 28),
                const Text(
                  "Build foundational infrastructure that empowers schools to operate with resilience, sovereignty, and institutional authority—regardless of connectivity constraints.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 32),
                const Divider(color: Colors.white10),
                const SizedBox(height: 32),
                const Text(
                  "We are infrastructure deployment partners, not software vendors. We select institutions based on operational readiness, not payment capacity. We build systems that treat data sovereignty as a right, not a feature.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.7,
                  ),
                ),
              ],
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
                    "Conceptualized by Nyasha Gabriel & Sir Legend (KwaLegend)",
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Strategic Partnership: Sir Legend holds 30% equity stake",
                    style: TextStyle(color: Colors.white24, fontSize: 10),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "© 2025 Greyway Co (Formerly Batch Tech Venture)",
                    style: TextStyle(color: Colors.white10, fontSize: 11),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Development sponsored by KwaLegend",
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
                      child: const Text(
                        "BEGIN INSTITUTIONAL ASSESSMENT",
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
