import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';
import '../theme/theme.dart';
import '../services/app_state.dart';

class JobMatchesScreen extends StatelessWidget {
  const JobMatchesScreen({Key? key}) : super(key: key);

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
                'Please upload a resume in the Dashboard to see job matches.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white54),
                textAlign: TextAlign.center,
              ),
            );
          }

          final jobs = result.jobMatches;

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Job Matches',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 24),
                if (jobs.isEmpty)
                  Expanded(
                    child: Center(
                      child: Text(
                        'No job matches found based on your skills.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white54),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.separated(
                      itemCount: jobs.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final job = jobs[index];
                        final match = job.matchPercentage;
                        
                        return GlassCard(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      job.title,
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Match: $match%',
                                      style: TextStyle(
                                        color: match >= 70 ? AppTheme.primary : Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    value: match / 100,
                                    color: match >= 70 ? AppTheme.primary : Colors.orange,
                                    backgroundColor: Colors.white12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
