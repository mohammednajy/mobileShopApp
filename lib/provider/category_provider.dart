import 'package:mobile_shop_application/data/api/services/category_api.dart';
import 'package:mobile_shop_application/data/models/product_model.dart';
import 'package:mobile_shop_application/provider/home_provider.dart';

import '../data/models/category_model.dart';

class CategoryProvider extends Loading {
  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  List<ProductModel> searchProducts = [];
  List<CategoryModel> searchCategories = [];

  Future<void> getCategories() async {
    setLoading(true);
    categories = await CategoryApi.getCategoriesList();
    notifyListeners();
  }

  Future<void> getCategoryProductList({required int id}) async {
    setLoading(true);
    products = await CategoryApi.getCategoryProductList(id: id);
    notifyListeners();
  }

  searchCategory(String categoryName) {
    searchCategories = categories
        .where((element) =>
            element.name.toLowerCase().startsWith(categoryName.toLowerCase()))
        .toList();
    notifyListeners();
  }

  searchProduct(String productName) {
    searchProducts = products
        .where((element) =>
            element.name.toLowerCase().startsWith(productName.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
