import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/home_provider.dart';
import '../../../../utils/constant.dart';

class ProductSection extends StatefulWidget {
  const ProductSection({super.key});

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  // bool favoriteSelected = false;
  // int indexSelected = -1;
  @override
  Widget build(BuildContext context) {
    print(context.watch<HomeProvider>().favoriteId);
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (_, index) => InkWell(
          onTap: () {
            print(index);
          },
          child: Card(
            color: Colors.white,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: !(homeProvider.products[index].discount == 0),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            '-${homeProvider.products[index].discount}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            homeProvider.favoriteId
                                    .contains(homeProvider.products[index].id)
                                ? homeProvider.deleteFavorite(
                                    id: homeProvider.products[index].id)
                                : homeProvider.addFavorite(
                                    id: homeProvider.products[index].id);
                          },
                          icon: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: homeProvider.favoriteId
                                      .contains(homeProvider.products[index].id)
                                  ? Colors.green
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              AssetPath.favoriteIcon,
                              color: homeProvider.favoriteId
                                      .contains(homeProvider.products[index].id)
                                  ? Colors.white
                                  : Colors.black54,
                              scale: 1.2,
                            ),
                          ))
                    ],
                  ),
                  Image.network(
                    homeProvider.products[index].image,
                    fit: BoxFit.contain,
                    height: 110,
                    width: 110,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Image.asset(
                        AssetPath.placeholder,
                        height: 100,
                        width: 100,
                      );
                    },
                    errorBuilder: (context, error, progress) {
                      if (progress == null) {}
                      return Image.asset(
                        AssetPath.placeholder,
                        height: 100,
                        width: 100,
                      );
                    },
                  ),
                  Text(
                    homeProvider.products[index].name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${homeProvider.products[index].price} \$",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        itemCount: homeProvider.products.length,
      ),
    );
  }
}
