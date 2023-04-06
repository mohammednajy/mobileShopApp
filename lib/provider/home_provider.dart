import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_shop_application/data/api/services/home_api.dart';

import '../data/api/app_exceptions.dart';
import '../utils/helpar.dart';

class HomeProvider with UtilsConfig, ChangeNotifier {
  List<String> banners = [];
  getBanners() async {
    try {
      Response response = await HomeApi.getBannerList();
      if (response.statusCode == 200) {
        banners = (response.data["data"] as List)
            .map((e) => e["image"] as String)
            .toList();
        print(banners);
        notifyListeners();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      showSnackBarMessage(message: errorMessage, status: false);
    }
  }
}
