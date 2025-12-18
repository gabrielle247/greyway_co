// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// --- Greyway.Co Institutional Model ---
class SchoolApplication {
  String schoolName = "";
  String schoolType = "Private";
  String studentCountRange = "1-50 Students";
  String currentSystem = "Manual Paper Records";
  bool requiresOffline = true;
  String applicantName = "";
  String applicantRole = "Principal";
  String email = "";
  String phone = "";
  bool authorized = false;

  // Decision Logic: Scoring the Institution's Priority
  String getEligibilityTier() {
    int score = 0;
    if (studentCountRange.contains("201") || studentCountRange.contains("500")) score += 3;
    if (requiresOffline) score += 2;
    if (currentSystem == "Manual Paper Records") score += 3;
    
    if (score >= 6) return "CRITICAL_PATH_PILOT";
    if (score >= 4) return "STANDARD_INFRASTRUCTURE_PILOT";
    return "OPERATIONAL_ASSESSMENT_ONLY";
  }
}

class SchoolApplicationWizard extends StatefulWidget {
  const SchoolApplicationWizard({super.key});

  @override
  State<SchoolApplicationWizard> createState() => _SchoolApplicationWizardState();
}

class _SchoolApplicationWizardState extends State<SchoolApplicationWizard> {
  final PageController _pageController = PageController();
  final SchoolApplication _appData = SchoolApplication();
  final _formKey = GlobalKey<FormState>();
  
  // Field Controllers
  final _schoolNameController = TextEditingController();
  final _applicantNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  
  int _currentStep = 0;
  bool _isSubmitting = false;
  bool _isComplete = false;

  // Greyway.Co Institutional Brand Colors
  final Color bgColor = const Color(0xff121b22);
  final Color surfaceColor = const Color(0xff1c2a35);
  final Color primaryBlue = Colors.blue;

  void _nextStep() {
    final isLastStep = _currentStep == 5;
    if (!_formKey.currentState!.validate()) return;

    if (isLastStep) {
      _submitToGreywayPipeline();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  Future<void> _submitToGreywayPipeline() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_appData.authorized) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Authorization is required to proceed")),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      // Initialize Supabase client using loaded secrets (ensures .env is honored)
      final supabase = Supabase.instance.client;

      await supabase.from('school_applications').insert({
        'school_name': _schoolNameController.text.trim(),
        'school_type': _appData.schoolType,
        'student_count_range': _appData.studentCountRange,
        'current_system': _appData.currentSystem,
        'requires_offline': _appData.requiresOffline,
        'applicant_name': _applicantNameController.text.trim(),
        'applicant_role': _appData.applicantRole,
        'contact_email': _emailController.text.trim(),
        'contact_phone': _phoneController.text.trim(),
        'authorized_submission': _appData.authorized,
        'eligibility_tier': _appData.getEligibilityTier(),
        'submitted_at': DateTime.now().toUtc().toIso8601String(),
      });

      setState(() {
        _isSubmitting = false;
        _isComplete = true;
      });
    } catch (e) {
      setState(() => _isSubmitting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Infrastructure Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isSubmitting) return _buildLoading();
    if (_isComplete) return _buildSuccess();

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900), // Optimized for Linux/Web
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              _buildProgressHeader(),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (i) => setState(() => _currentStep = i),
                    children: [
                      _stepEligibilityBrief(),
                      _stepInstitution(),
                      _stepCapacity(),
                      _stepInfrastructure(),
                      _stepApplicant(),
                      _stepLegal(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("GREYWAY.CO • INFRASTRUCTURE ASSESSMENT", 
            style: TextStyle(color: Colors.white.withAlpha(100), letterSpacing: 3, fontSize: 10, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: (_currentStep + 1) / 6,
              backgroundColor: primaryBlue.withAlpha(30),
              color: primaryBlue,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepLayout({required String tag, required String title, required Widget content}) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tag, style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 12)),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, height: 1.2)),
          const SizedBox(height: 40),
          Expanded(child: SingleChildScrollView(child: content)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (_currentStep == 5 && !_appData.authorized) ? null : _nextStep,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryBlue,
              minimumSize: const Size(double.infinity, 65),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(_currentStep == 5 ? "SUBMIT ASSESSMENT" : "CONTINUE", 
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
    );
  }

  // --- WIZARD STEPS ---

  Widget _stepEligibilityBrief() {
    return _buildStepLayout(
      tag: "PHASE 0",
      title: "Readiness Briefing",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Greyway.Co pilot slots are reserved for institutions meeting specific operational standards. Before you apply, ensure you meet the following baseline requirements:",
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 24),
          _buildBullet("Institutional authority to migrate financial records."),
          _buildBullet("Willingness to participate in a 90-day assessment phase."),
          _buildBullet("Minimum connectivity for initial synchronization."),
        ],
      ),
    );
  }

  Widget _stepInstitution() {
    return _buildStepLayout(
      tag: "IDENTITY",
      title: "Institution Identity",
      content: Column(
        children: [
          _buildTextField(_schoolNameController, "Official Institution Name"),
          const SizedBox(height: 20),
          _buildDropdown("Institutional Category", ["Private", "Public", "Mission", "Academy"], _appData.schoolType, (v) => setState(() => _appData.schoolType = v!)),
        ],
      ),
    );
  }

  Widget _stepCapacity() {
    return _buildStepLayout(
      tag: "SCALE",
      title: "Operational Capacity",
      content: Column(
        children: [
          _buildDropdown("Student Population", ["1-50 Students", "51-200 Students", "201-500 Students", "500+ Students"], _appData.studentCountRange, (v) => setState(() => _appData.studentCountRange = v!)),
          const SizedBox(height: 20),
          _buildDropdown("Current Financial System", ["Manual Paper Records", "General Spreadsheets", "Legacy Software"], _appData.currentSystem, (v) => setState(() => _appData.currentSystem = v!)),
        ],
      ),
    );
  }

  Widget _stepInfrastructure() {
    return _buildStepLayout(
      tag: "INFRASTRUCTURE",
      title: "Connectivity Requirements",
      content: SwitchListTile(
        title: const Text("Require Offline-First Support?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: const Text("Enable local database caching for unreliable internet conditions.", style: TextStyle(color: Colors.white60, fontSize: 12)),
        value: _appData.requiresOffline,
        onChanged: (v) => setState(() => _appData.requiresOffline = v),
        activeColor: primaryBlue,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  Widget _stepApplicant() {
    return _buildStepLayout(
      tag: "OWNERSHIP",
      title: "Applicant Information",
      content: Column(
        children: [
          _buildTextField(_applicantNameController, "Your Full Name"),
          const SizedBox(height: 16),
          _buildDropdown("Administrative Role", ["Principal", "Bursar", "IT Admin", "Director"], _appData.applicantRole, (v) => setState(() => _appData.applicantRole = v!)),
          const SizedBox(height: 16),
          _buildTextField(_emailController, "Official Contact Email", type: TextInputType.emailAddress),
          const SizedBox(height: 16),
          _buildTextField(_phoneController, "Contact Phone Number", type: TextInputType.phone),
        ],
      ),
    );
  }

  Widget _stepLegal() {
    return _buildStepLayout(
      tag: "COMPLIANCE",
      title: "Final Authorization",
      content: Column(
        children: [
          Text(
            "By submitting, you authorize Greyway.Co to conduct an internal eligibility scoring against your institution. You confirm that you have the governance authority to request pilot deployment.",
            style: TextStyle(color: Colors.white.withAlpha(180), fontSize: 14, height: 1.6),
          ),
          const SizedBox(height: 30),
          CheckboxListTile(
            title: const Text("I am authorized to apply on behalf of this institution.", style: TextStyle(color: Colors.white, fontSize: 14)),
            value: _appData.authorized,
            onChanged: (v) => setState(() => _appData.authorized = v!),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: primaryBlue,
            contentPadding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  // --- HELPERS ---

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: primaryBlue, size: 18),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {TextInputType type = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "$label is required";
        }
        if (label.toLowerCase().contains('email') && !value.contains('@')) {
          return "Enter a valid email address";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: surfaceColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String current, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: current,
      dropdownColor: surfaceColor,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: surfaceColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
      items: items.map((i) => DropdownMenuItem(value: i, child: Text(i))).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildLoading() => Scaffold(backgroundColor: bgColor, body: const Center(child: CircularProgressIndicator()));

  Widget _buildSuccess() {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_balance, color: Colors.greenAccent, size: 80),
              const SizedBox(height: 32),
              const Text("Phase 0: Intake Complete", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              _buildPhaseIndicator(1),
              const SizedBox(height: 32),
              const Text(
                "Your institution has entered the Greyway.Co Pilot Queue. Eligibility scoring is underway. Your primary contact will be notified of the deployment decision.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 40),
              Text("ID: ${DateTime.now().millisecondsSinceEpoch}", style: TextStyle(color: Colors.white.withAlpha(50), fontSize: 12, letterSpacing: 2)),
              const SizedBox(height: 40),
              TextButton(onPressed: () => Navigator.pop(context), child: Text("RETURN TO PORTAL", style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhaseIndicator(int currentPhase) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        bool isDone = index < currentPhase;
        bool isCurrent = index == currentPhase;
        return Row(
          children: [
            Container(
              width: 24, height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDone ? Colors.greenAccent : (isCurrent ? primaryBlue : Colors.white.withAlpha(20)),
              ),
              child: Center(child: Text("${index + 1}", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
            ),
            if (index < 3) Container(width: 40, height: 2, color: isDone ? Colors.greenAccent : Colors.white.withAlpha(20)),
          ],
        );
      }),
    );
  }
}