import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../models/analysis_result.dart';

class ApiService {
  // Use 127.0.0.1 for local testing
  static const String baseUrl = 'http://127.0.0.1:8000';

  static Future<AnalysisResult> analyzeResume(String filePath) async {
    // This will only work on desktop/mobile
    var uri = Uri.parse('$baseUrl/analyze');
    var request = http.MultipartRequest('POST', uri);

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        filePath,
        contentType: MediaType('application', 'pdf'),
      ),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var json = jsonDecode(responseData);
      return AnalysisResult.fromJson(json);
    } else {
      var errorData = await response.stream.bytesToString();
      throw Exception('Failed to analyze resume: ${response.statusCode} - $errorData');
    }
  }

  static Future<AnalysisResult> analyzeResumeBytes(List<int> bytes, String filename) async {
    var uri = Uri.parse('$baseUrl/analyze');
    var request = http.MultipartRequest('POST', uri);

    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        bytes,
        filename: filename,
        contentType: MediaType('application', 'pdf'),
      ),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var json = jsonDecode(responseData);
      return AnalysisResult.fromJson(json);
    } else {
      var errorData = await response.stream.bytesToString();
      throw Exception('Failed to analyze resume: ${response.statusCode} - $errorData');
    }
  }
}
