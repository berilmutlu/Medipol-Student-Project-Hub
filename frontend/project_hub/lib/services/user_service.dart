import 'package:dio/dio.dart';
import 'api_client.dart';
import 'api_config.dart';

/// User Service
/// Handles all user-related API calls
class UserService {
  final ApiClient _apiClient = ApiClient();

  /// Get all faculty members
  Future<List<Map<String, dynamic>>> getAllFaculty() async {
    try {
      final response = await _apiClient.get('${ApiConfig.usersEndpoint}faculty/');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'] ?? response.data;
        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load faculty');
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Get all students
  Future<List<Map<String, dynamic>>> getAllStudents() async {
    try {
      final response = await _apiClient.get('${ApiConfig.usersEndpoint}students/');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'] ?? response.data;
        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load students');
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Handle Dio errors
  String _handleError(DioException error) {
    if (error.response != null) {
      final data = error.response!.data;
      if (data is Map) {
        if (data.containsKey('detail')) {
          return data['detail'];
        } else if (data.containsKey('error')) {
          return data['error'];
        } else {
          for (var value in data.values) {
            if (value is String) return value;
            if (value is List && value.isNotEmpty) return value.first.toString();
          }
        }
      }
      return 'Error: ${error.response!.statusCode}';
    } else if (error.type == DioExceptionType.connectionTimeout) {
      return 'Connection timeout. Please check your internet connection.';
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return 'Server response timeout. Please try again.';
    } else {
      return 'Network error. Please check your connection.';
    }
  }
}
