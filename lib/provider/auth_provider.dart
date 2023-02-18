import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_shop_application/data/models/user_model.dart';
import 'package:mobile_shop_application/router/router_services.dart';
import 'package:mobile_shop_application/router/screen_name.dart';

import '../data/api/app_exceptions.dart';
import '../data/api/services/auth_api.dart';
import '../utils/helpar.dart';

class AuthProvider extends ChangeNotifier with UtilsConfig {
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  login({required String email, required String password}) async {
    try {
      setLoading(true);
      final response = await AuthApi.logIn(email:email ,password:password );
      if (response.statusCode == 200) {
        if (response.data["status"] == false) {
          showSnackBarMessage(message: response.data["message"], status: false);
        } else {
          UserModel user = UserModel.fromMap(response.data);
          showSnackBarMessage(message: user.message, status: user.status);
          AppRouter.goAndRemove(ScreenName.homeScreen);
        }
      }
      setLoading(false);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      showSnackBarMessage(message: errorMessage, status: false);
      setLoading(false);
    }
  }
}
