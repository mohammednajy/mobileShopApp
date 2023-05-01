import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/product_model.dart';
import '../../../provider/home_provider.dart';
import '../../../utils/constant.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    this.onTap,
    required this.product,
    required this.favoriteId,
    // required this.heroTag,
    Key? key,
  }) : super(key: key);
  final void Function()? onTap;
  final ProductModel product;
  final List<int> favoriteId;
  // final String heroTag;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !(product.discount == 0),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        '-${product.discount}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                  FavoriteIconWidget(
                      // favoriteId: favoriteId,
                      product: product)
                ],
              ),
              Hero(
                tag: product.id,
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.contain,
                  height: 110,
                  width: 110,
                  errorWidget: (_, s, m) {
                    return Image.asset(
                      AssetPath.placeholder,
                      height: 100,
                      width: 100,
                    );
                  },
                  placeholder: (buildContext, string) {
                    return Image.asset(AssetPath.placeholder);
                  },
                ),
              ),
              Text(
                product.name,
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
                "${product.price} \$",
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
    );
  }
}

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({
    Key? key,
    // required this.favoriteId,
    required this.product,
  }) : super(key: key);

  // final List<int> favoriteId;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => IconButton(
          onPressed: () {
            homeProvider.favoriteId.contains(product.id)
                ? homeProvider.deleteFavorite(id: product.id)
                : homeProvider.addFavorite(id: product.id);
            // setState(() {});
          },
          icon: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: homeProvider.favoriteId.contains(product.id)
                  ? Colors.green
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              AssetPath.favoriteIcon,
              color: homeProvider.favoriteId.contains(product.id)
                  ? Colors.white
                  : Colors.black54,
              scale: 1.2,
            ),
          )),
    );
  }
}
