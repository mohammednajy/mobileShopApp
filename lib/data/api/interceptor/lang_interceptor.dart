import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_shop_application/data/localData/shared_pref.dart';
import 'package:mobile_shop_application/provider/category_provider.dart';
import 'package:mobile_shop_application/provider/home_provider.dart';
import 'package:mobile_shop_application/router/router_services.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import '../../../utils/helpar.dart';
import '../../../utils/locator.dart';
import '../app_exceptions.dart';

class LangInterceptor extends Interceptor {
  AuthProvider authLoading = Provider.of<AuthProvider>(
      AppRouter.navigatorKey.currentContext!,
      listen: false);
  HomeProvider homeLoading = Provider.of<HomeProvider>(
      AppRouter.navigatorKey.currentContext!,
      listen: false);
  CategoryProvider categoryProvider = Provider.of<CategoryProvider>(
      AppRouter.navigatorKey.currentContext!,
      listen: false);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    authLoading.setLoading(true);
    options.headers = {
      "lang": "en",
      "Authorization": SharedPrefController().getLogin()
          ? SharedPrefController().getUser().token
          : ""
    };
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    authLoading.setLoading(false);
    homeLoading.setLoading(false);
    categoryProvider.setLoading(false);
    if (response.data["status"] == false) {
      UtilsConfig.showSnackBarMessage(
          message: response.data["message"], status: false);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    authLoading.setLoading(false);
    homeLoading.setLoading(false);
    categoryProvider.setLoading(false);
    homeLoading.setProductLoading(false);
    final errorMessage = DioExceptions.fromDioError(err);
    UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    // super.onError(err, handler);
  }
}
