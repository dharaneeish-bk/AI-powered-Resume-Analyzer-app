class JobMatch {
  final String title;
  final int matchPercentage;

  JobMatch({required this.title, required this.matchPercentage});

  factory JobMatch.fromJson(Map<String, dynamic> json) {
    return JobMatch(
      title: json['title'] ?? '',
      matchPercentage: json['match_percentage'] ?? 0,
    );
  }
}

class AnalysisResult {
  final int score;
  final List<String> skills;
  final List<String> missingSkills;
  final List<JobMatch> jobMatches;
  final String suggestions;

  AnalysisResult({
    required this.score,
    required this.skills,
    required this.missingSkills,
    required this.jobMatches,
    required this.suggestions,
  });

  factory AnalysisResult.fromJson(Map<String, dynamic> json) {
    var jobMatchesList = json['job_matches'] as List? ?? [];
    List<JobMatch> jobMatches = jobMatchesList.map((i) => JobMatch.fromJson(i)).toList();

    return AnalysisResult(
      score: json['score'] ?? 0,
      skills: List<String>.from(json['skills'] ?? []),
      missingSkills: List<String>.from(json['missing_skills'] ?? []),
      jobMatches: jobMatches,
      suggestions: json['suggestions'] ?? '',
    );
  }
}
