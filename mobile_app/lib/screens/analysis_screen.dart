import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';
import '../widgets/score_gauge.dart';
import '../widgets/skill_chip.dart';
import '../theme/theme.dart';
import '../services/app_state.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListenableBuilder(
        listenable: AppState(),
        builder: (context, _) {
          final result = AppState().currentResult;

          if (result == null) {
            return Center(
              child: Text(
                'Please upload a resume in the Dashboard to see your analysis.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white54),
                textAlign: TextAlign.center,
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detailed Analysis',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 24),
                GlassCard(
                  child: Column(
                    children: [
                      Text('Overall Resume Score', style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 16),
                      ScoreGauge(score: result.score),
                      const SizedBox(height: 16),
                      Text(
                        result.suggestions,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Skill Breakdown',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 16),
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Matched Core Skills', style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 8),
                      if (result.skills.isEmpty)
                        const Text('No core skills detected.', style: TextStyle(color: Colors.white54))
                      else
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: result.skills.map((s) => SkillChip(label: s)).toList(),
                        ),
                      const SizedBox(height: 24),
                      Text('Recommended Skills to Add', style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 8),
                      if (result.missingSkills.isEmpty)
                        const Text('You have all the required skills for top roles!', style: TextStyle(color: Colors.white54))
                      else
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: result.missingSkills.map((s) => SkillChip(label: s, isMissing: true)).toList(),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Improvement Suggestions',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 16),
                GlassCard(
                  child: Column(
                    children: [
                      _buildSuggestionItem(context, Icons.show_chart, 'Quantify achievements', 'Use metrics to describe your past experiences (e.g. "Increased performance by 20%").'),
                      const Divider(color: Colors.white12, height: 24),
                      _buildSuggestionItem(context, Icons.format_align_left, 'Action Verbs', 'Start bullet points with strong action verbs like "Developed", "Led", "Architected".'),
                      const Divider(color: Colors.white12, height: 24),
                      _buildSuggestionItem(context, Icons.link, 'Portfolio Links', 'Ensure GitHub and LinkedIn links are clickable and prominently placed.'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSuggestionItem(BuildContext context, IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppTheme.primary, size: 28),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
            ],
          ),
        ),
      ],
    );
  }
}
