import 'package:flutter/material.dart';
import '../theme/theme.dart';

class ScoreGauge extends StatelessWidget {
  final int score;

  const ScoreGauge({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: CircularProgressIndicator(
            value: score / 100,
            strokeWidth: 10,
            backgroundColor: Colors.white.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(
              score > 70 ? AppTheme.primary : (score > 40 ? Colors.orange : Colors.red),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$score%',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppTheme.primary,
              ),
            ),
            Text(
              'Match',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
