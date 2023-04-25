import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_shop_application/data/localData/shared_pref.dart';
import 'package:mobile_shop_application/data/models/user_model.dart';
import 'package:mobile_shop_application/provider/home_provider.dart';
import 'package:mobile_shop_application/router/router_services.dart';
import 'package:mobile_shop_application/router/screen_name.dart';

import '../data/api/app_exceptions.dart';
import '../data/api/services/auth_api.dart';
import '../data/models/response_model.dart';
import '../utils/helpar.dart';

class AuthProvider extends Loading {
  login({required String email, required String password}) async {
    final response = await AuthApi.logIn(email: email, password: password);
    if (response.data["status"] == true) {
      UserModel user = UserModel.fromJson(response.data);
      await SharedPrefController().save(user);
      SharedPrefController().setLogin();
      UtilsConfig.showSnackBarMessage(
          message: user.message, status: user.status);
      AppRouter.goAndRemove(ScreenName.homeScreen);
    }
  }

  singUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    final response = await AuthApi.singUp(
        name: name, phone: phone, email: email, password: password);
    if (response.data["status"] == true) {
      ResponseModel responseModel = ResponseModel.fromMap(response.data);
      UtilsConfig.showSnackBarMessage(
          message: responseModel.message, status: responseModel.status);
      AppRouter.goAndRemove(ScreenName.loginScreen);
    }
  }
}
