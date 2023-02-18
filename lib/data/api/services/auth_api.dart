import 'package:dio/dio.dart';
import 'package:mobile_shop_application/data/api/endpoints.dart';
import '../base_client.dart';

class AuthApi {
  static Future<Response> logIn(
      {required String email, required String password}) async {
    try {
      return await BaseClient().post(
        EndPoints.loginEndPoint,
        data: {"email": email, "password": password},
      );
    } catch (e) {
      rethrow;
    }
  }
}
