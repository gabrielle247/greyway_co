import 'package:equatable/equatable.dart';

class SchoolApplication extends Equatable {
  final String? id;
  final DateTime? submittedAt;

  // Institution
  final String schoolName;
  final String schoolType;
  final String studentCountRange;
  final String currentSystem;
  final bool requiresOffline;

  // Applicant
  final String applicantName;
  final String applicantRole;
  final String contactEmail;
  final String contactPhone;

  // Consent
  final bool authorizedSubmission;

  const SchoolApplication({
    this.id,
    this.submittedAt,
    required this.schoolName,
    required this.schoolType,
    required this.studentCountRange,
    required this.currentSystem,
    required this.requiresOffline,
    required this.applicantName,
    required this.applicantRole,
    required this.contactEmail,
    required this.contactPhone,
    required this.authorizedSubmission,
  });

  Map<String, dynamic> toJson() {
    return {
      'school_name': schoolName,
      'school_type': schoolType,
      'student_count_range': studentCountRange,
      'current_system': currentSystem,
      'requires_offline': requiresOffline,
      'applicant_name': applicantName,
      'applicant_role': applicantRole,
      'contact_email': contactEmail,
      'contact_phone': contactPhone,
      'authorized_submission': authorizedSubmission,
    };
  }

  @override
  List<Object?> get props => [id, schoolName, contactEmail];

  // Based on the 'Infrastructure Authority' model
  String getEligibilityTier() {
    int score = 0;

    // Logic based on institutional scale
    if (studentCountRange == "201-500 Students" ||
        studentCountRange == "500+ Students") {
      score += 3;
    }
    if (studentCountRange == "51-200 Students") score += 2;

    // Logic based on infrastructure need
    if (requiresOffline) {
      score += 2; // High priority for our PowerSync architecture
    }

    // Logic based on urgency (Manual records are high priority for migration)
    if (currentSystem == "Manual Paper Records") score += 3;

    if (score >= 6) return "HIGH_PRIORITY_PILOT";
    if (score >= 4) return "STANDARD_PILOT";
    return "RECORDS_ASSESSMENT_ONLY";
  }
}
