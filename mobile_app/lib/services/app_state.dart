import 'package:flutter/foundation.dart';
import '../models/analysis_result.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();
  
  factory AppState() {
    return _instance;
  }
  
  AppState._internal();

  AnalysisResult? _currentResult;

  AnalysisResult? get currentResult => _currentResult;

  void setResult(AnalysisResult result) {
    _currentResult = result;
    notifyListeners();
  }
  
  void clearResult() {
    _currentResult = null;
    notifyListeners();
  }
}
