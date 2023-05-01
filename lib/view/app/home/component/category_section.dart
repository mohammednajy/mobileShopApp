import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop_application/provider/category_provider.dart';
import 'package:provider/provider.dart';

import '../../../../provider/home_provider.dart';
import '../../../../router/router_services.dart';
import '../../../../router/screen_name.dart';
import '../../../../utils/constant.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, CategoryProvider>(
      builder: (context, homeProvider, categoryProvider, child) => SizedBox(
        height: 110,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              AppRouter.goTo(
                ScreenName.productsScreen,
                arguments: categoryProvider.categories[index],
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 4)
                      ]),
                  height: 60,
                  width: 60,
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    imageUrl: categoryProvider.categories[index].image,
                    placeholder: (_, s) {
                      return Image.asset(AssetPath.placeholder);
                    },
                    fit: BoxFit.fill,
                    height: 60,
                    errorWidget: (context, error, trace) {
                      return Image.asset(
                        AssetPath.placeholder,
                        // fit: BoxFit.fill,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  categoryProvider.categories[index].name.contains(' ')
                      ? ' ${categoryProvider.categories[index].name.split(' ')[0]}\n ${categoryProvider.categories[index].name.split(' ')[1]}'
                      : categoryProvider.categories[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 15,
          ),
          itemCount: categoryProvider.categories.length,
        ),
      ),
    );
  }
}
