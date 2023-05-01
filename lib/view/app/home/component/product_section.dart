import 'package:flutter/material.dart';
import 'package:mobile_shop_application/data/models/product_model.dart';
import 'package:provider/provider.dart';

import '../../../../provider/home_provider.dart';
import '../../../../router/router_services.dart';
import '../../../../router/screen_name.dart';
import '../../../../utils/constant.dart';
import '../../../shared/card/product_item_widget.dart';

class ProductSection extends StatefulWidget {
  const ProductSection({super.key});

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (_, index) => ProductItemWidget(
          product: homeProvider.products[index],
          onTap: () {
            AppRouter.goTo(ScreenName.productDetailsScreen,
                arguments: homeProvider.products[index]);
          },
          favoriteId: homeProvider.favoriteId,
        ),
        itemCount: homeProvider.products.length,
      ),
    );
  }
}
