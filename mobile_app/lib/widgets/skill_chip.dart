import 'package:flutter/material.dart';
import '../theme/theme.dart';

class SkillChip extends StatelessWidget {
  final String label;
  final bool isMissing;

  const SkillChip({
    Key? key,
    required this.label,
    this.isMissing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isMissing ? const Color(0xFF93000a).withOpacity(0.2) : AppTheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isMissing ? const Color(0xFFffb4ab) : AppTheme.secondary,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: isMissing ? const Color(0xFFffdad6) : AppTheme.secondary,
        ),
      ),
    );
  }
}
