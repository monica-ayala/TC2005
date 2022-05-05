import 'dart:convert';
import 'dart:developer';

import 'package:yolotl/core/error/exceptions.dart';
import 'package:yolotl/core/global/environment.dart';
import 'package:yolotl/core/services/auth_service.dart';
import 'package:yolotl/features/auth/data/models/login_response.dart';
import 'package:yolotl/features/auth/data/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserModel> userIsLoggedIn();

  Future<UserModel> userLogin({
    required String email,
    required String password,
  });

  Future<UserModel> userRegister({
    required String email,
    required String password,
    required String name,
  });

  Future<UserModel> googleSignUp({
    required String token,
  });

  Future<UserModel> googleSignIn({
    required String token,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl({required this.client});
  final _storage = new FlutterSecureStorage();
  final http.Client client;
  final uri = Environment.apiUrl;

  @override
  Future<UserModel> userIsLoggedIn() async {
    final endPoint = Uri.https(uri, 'api/v1/login/renew');

    final String? token = await AuthService.getToken();

    if (token == null) {
      throw ServerException();
    }

    final response = await http.get(endPoint, headers: {
      'Content-Type': 'application/json',
      'x-token': token,
    });

    if (response.statusCode == 200) {
      log(response.body);
      final loginResponse = loginResponseFromJson(response.body);
      await this._guardarToken(loginResponse.token);
      return loginResponse.user;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> userLogin({
    required String email,
    required String password,
  }) async {
    final endPoint = Uri.https(uri, 'api/v1/login');

    final Map<String, String> data = <String, String>{
      'email': email,
      'password': password,
    };

    final response =
        await http.post(endPoint, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      await this._guardarToken(loginResponse.token);
      return loginResponse.user;
    } else if (response.statusCode == 404) {
      throw EmailException();
    } else if (response.statusCode == 400) {
      throw PasswordException();
    } else if (response.statusCode == 401) {
      throw InactiveException();
    }
    {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> userRegister({
    required String email,
    required String password,
    required String name,
  }) async {
    final endPoint = Uri.https(uri, '/api/v1/login/new');

    final data = {
      'email': email,
      'password': password,
      'name': name,
    };

    final response = await http.post(endPoint,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      await this._guardarToken(loginResponse.token);
      return loginResponse.user;
    } else if (response.statusCode == 400) {
      throw RegisterException();
    } else {
      throw ServerException();
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  @override
  Future<UserModel> googleSignIn({required String token}) async {
    final endPoint = Uri.https(uri, '/api/v1/login/google');

    final Map<String, String> data = <String, String>{
      'token': token,
    };

    final response =
        await http.post(endPoint, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      await _guardarToken(loginResponse.token);
      return loginResponse.user;
    } else if (response.statusCode == 404) {
      throw EmailException();
    } else if (response.statusCode == 400) {
      throw PasswordException();
    } else if (response.statusCode == 401) {
      throw InactiveException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> googleSignUp({required String token}) async {
    final endPoint = Uri.https(uri, '/api/v1/login/google/new');

    final Map<String, String> data = <String, String>{
      'token': token,
    };

    log(token);

    final response =
        await http.post(endPoint, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    log(response.body.toString());

    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      await _guardarToken(loginResponse.token);
      return loginResponse.user;
    } else if (response.statusCode == 400) {
      throw RegisterException();
    } else {
      throw ServerException();
    }
  }
}
