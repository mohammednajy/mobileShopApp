import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_shop_application/data/api/services/home_api.dart';
import 'package:mobile_shop_application/data/models/category_model.dart';
import 'package:mobile_shop_application/data/models/product_model.dart';

class HomeProvider extends Loading {
  List<String> banners = [];
  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  List<ProductModel> favoriteProducts = [];
  bool homeProductLoading = false;
  List<int> favoriteId = [];
  getBanners() async {
    setLoading(true);
    Response response = await HomeApi.getBannerList();
    if (response.statusCode == 200) {
      banners = (response.data["data"] as List)
          .map((e) => e["image"] as String)
          .toList();
      notifyListeners();
    }
  }

  getCategories() async {
    setLoading(true);

    Response response = await HomeApi.getCategoriesList();
    if (response.statusCode == 200) {
      categories = (response.data["data"]["data"] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
      notifyListeners();
    }
  }

  getHomeData() async {
    setProductLoading(true);
    Response response = await HomeApi.getHomeData();

    if (response.statusCode == 200) {
      products = (response.data["data"]["products"] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      notifyListeners();
    }
    setProductLoading(false);
  }

  getFavorite() async {
    favoriteId = [];
    notifyListeners();
    Response response = await HomeApi.getFavoriteProducts();
    if (response.statusCode == 200) {
      favoriteProducts = (response.data["data"]["data"] as List).map((e) {
        favoriteId.add(e["product"]["id"]);
        notifyListeners();
        return ProductModel.fromJson(e["product"]);
      }).toList();

      notifyListeners();
    }
  }

  addFavorite({required int id}) async {
    Response response = await HomeApi.addDeleteFavorite(id: id);
    if (response.statusCode == 200 && response.data["status"]) {
      print(response.data);
      print('iddddd ' + response.data["data"]["product"]["id"].toString());
      favoriteId.add(response.data["data"]["product"]["id"]);
      // notifyListeners();
    }
  }

  deleteFavorite({required int id}) async {
    Response response = await HomeApi.addDeleteFavorite(id: id);
    if (response.statusCode == 200 && response.data["status"]) {
      print(response.data);
      favoriteId.remove(response.data["data"]["product"]["id"]);
      // notifyListeners();
    }
  }

  setProductLoading(bool loadingValue) {
    homeProductLoading = loadingValue;
    notifyListeners();
  }
}

class Loading extends ChangeNotifier {
  bool loading = false;

  setLoading(bool loadingValue) {
    loading = loadingValue;
    notifyListeners();
  }
}
