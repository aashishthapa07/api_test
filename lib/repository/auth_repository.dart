import 'dart:convert';
import 'package:api_test/auth/services/api_url.dart';
import 'package:api_test/model/user/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<String> login(UserModel user) async {
    final response = await http.post(
      Uri.parse('$ApiService/api/v1/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: user.toJson(),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['access_token'];
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<String> signup(UserModel user) async {
    final response = await http.post(
      Uri.parse('$ApiService/api/v1/auth/signup'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: user.toJson(),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['access_token'];
    } else {
      throw Exception('Failed to sign up');
    }
  }
}
