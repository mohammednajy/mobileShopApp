import 'package:dio/dio.dart';
import 'package:mobile_shop_application/data/models/product_model.dart';

import '../../models/category_model.dart';
import '../base_client.dart';
import '../endpoints.dart';

class CategoryApi {
  static Future<List<CategoryModel>> getCategoriesList() async {
    Response response = await BaseClient().get(
      EndPoints.categoriesEndPoint,
    );
    return (response.data["data"]["data"] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }

  static Future<List<ProductModel>> getCategoryProductList(
      {required int id}) async {
    Response response = await BaseClient().get(
      "${EndPoints.categoryProductList}$id",
    );
    return (response.data["data"]["data"] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
