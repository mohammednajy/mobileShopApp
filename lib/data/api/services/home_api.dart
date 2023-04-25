import 'package:dio/dio.dart';
import 'package:mobile_shop_application/data/localData/shared_pref.dart';

import '../base_client.dart';
import '../endpoints.dart';

class HomeApi {
  static Future<Response> getBannerList() async {
    return await BaseClient().get(
      EndPoints.bannersEndPoint,
    );
  }

  static Future<Response> getCategoriesList() async {
    return await BaseClient().get(
      EndPoints.categoriesEndPoint,
    );
  }

  static Future<Response> getHomeData() async {
    return await BaseClient().get(
      EndPoints.homeEndPoint,
    );
  }

  static Future<Response> getFavoriteProducts() async {
    return await BaseClient().get(
      EndPoints.favoriteEndPoint,
    );
  }

  static Future<Response> addDeleteFavorite({required int id}) async {
    return await BaseClient().post(
      EndPoints.favoriteEndPoint,
      data: {"product_id": id}
    );
  }
}
