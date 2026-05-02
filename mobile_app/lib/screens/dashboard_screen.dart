import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart' as fp;
import '../widgets/glass_card.dart';
import '../widgets/score_gauge.dart';
import '../widgets/skill_chip.dart';
import '../widgets/buttons.dart';
import '../services/api_service.dart';
import '../services/app_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Listen to global app state to rebuild if necessary
    AppState().addListener(_onStateChanged);
  }

  @override
  void dispose() {
    AppState().removeListener(_onStateChanged);
    super.dispose();
  }

  void _onStateChanged() {
    setState(() {});
  }

  void _uploadResume() async {
    try {
      fp.FilePickerResult? result = await fp.FilePicker.pickFiles(
        type: fp.FileType.custom,
        allowedExtensions: ['pdf'],
        withData: true, // Required for web
      );

      if (result != null) {
        setState(() {
          _isLoading = true;
          _errorMessage = null;
        });

        dynamic analysis;
        if (kIsWeb) {
          if (result.files.single.bytes != null) {
            analysis = await ApiService.analyzeResumeBytes(
              result.files.single.bytes!,
              result.files.single.name,
            );
          } else {
            throw Exception("File data not available for web upload.");
          }
        } else {
          if (result.files.single.path != null) {
            analysis = await ApiService.analyzeResume(result.files.single.path!);
          } else {
            throw Exception("File path not available.");
          }
        }
        
        AppState().setResult(analysis);
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final result = AppState().currentResult;
    final hasResult = result != null;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 24),
            GlassCard(
              child: Column(
                children: [
                  const Icon(Icons.upload_file, size: 48, color: Colors.white70),
                  const SizedBox(height: 16),
                  Text(
                    'Upload your Resume (PDF)',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    text: 'Select PDF File',
                    onPressed: _uploadResume,
                    isLoading: _isLoading,
                  ),
                  if (_errorMessage != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.redAccent),
                      textAlign: TextAlign.center,
                    ),
                  ]
                ],
              ),
            ),
            if (hasResult) ...[
              const SizedBox(height: 24),
              GlassCard(
                child: Column(
                  children: [
                    ScoreGauge(score: result.score),
                    const SizedBox(height: 24),
                    const Divider(color: Colors.white24),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Extracted Skills', style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: result.skills.map((s) => SkillChip(label: s)).toList(),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Missing Skills (Top Job)', style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: result.missingSkills.map((s) => SkillChip(label: s, isMissing: true)).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              GlassCard(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.lightbulb, color: Colors.amber),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        result.suggestions,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
