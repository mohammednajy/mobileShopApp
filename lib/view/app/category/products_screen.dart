import 'package:flutter/material.dart';
import 'package:mobile_shop_application/data/models/category_model.dart';
import 'package:mobile_shop_application/router/screen_name.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import '../../../provider/category_provider.dart';
import '../../../provider/home_provider.dart';
import '../../../router/router_services.dart';
import '../../shared/card/product_item_widget.dart';
import '../home/home_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({required this.category, super.key});
  final CategoryModel category;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<CategoryProvider>()
          .getCategoryProductList(id: widget.category.id);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            padding: const EdgeInsets.only(left: 10),
            onPressed: () => AppRouter.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '${widget.category.name} Category',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) => categoryProvider.loading
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 25,
                ),
                child: SingleChildScrollView(
                  child: SkeletonGridLoader(
                      itemsPerRow: 2,
                      items: 6,
                      childAspectRatio: 5 / 5,
                      builder: Container(
                        color: Colors.white,
                      )),
                ),
              )
            : categoryProvider.categories.isEmpty
                ? const Center(
                    child: Text('There is no element'),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Column(
                      children: [
                        SearchSection(
                          controller: searchController,
                          onChanged: (value) {
                            categoryProvider.searchProduct(value);
                          },
                        ),
                        searchController.text.isNotEmpty &&
                                categoryProvider.searchProducts.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Text(
                                  'There is no product',
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Expanded(
                                child:
                                    Consumer2<CategoryProvider, HomeProvider>(
                                  builder: (context, categoryProvider,
                                          homeProvider, child) =>
                                      GridView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.only(top: 20),
                                    physics: const BouncingScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 200,
                                            childAspectRatio: 3 / 4,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10),
                                    itemBuilder: (_, index) =>
                                        ProductItemWidget(
                                      product: searchController.text.isNotEmpty
                                          ? categoryProvider
                                              .searchProducts[index]
                                          : categoryProvider.products[index],
                                      onTap: () {
                                        AppRouter.goTo(
                                            ScreenName.productDetailsScreen,
                                            arguments:
                                                searchController.text.isNotEmpty
                                                    ? categoryProvider
                                                        .searchProducts[index]
                                                    : categoryProvider
                                                        .products[index]);
                                      },
                                      favoriteId: homeProvider.favoriteId,
                                    ),
                                    itemCount: searchController.text.isNotEmpty
                                        ? categoryProvider.searchProducts.length
                                        : categoryProvider.products.length,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
