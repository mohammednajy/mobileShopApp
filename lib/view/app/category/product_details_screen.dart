import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop_application/data/models/product_model.dart';
import 'package:mobile_shop_application/router/router_services.dart';
import 'package:mobile_shop_application/view/shared/button/custome_elevated_button.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../provider/home_provider.dart';
import '../../../utils/constant.dart';
import '../../shared/card/product_item_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    required this.productModel,
    super.key,
  });
  final ProductModel productModel;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            alignment: Alignment.topCenter,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: () {
              AppRouter.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    )),
                FavoriteIconWidget(
                  product: widget.productModel,
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetPath.productBackground),
              SizedBox(
                height: 300.h,
                child: PageView.builder(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Hero(
                    tag: widget.productModel.id,
                    child: CachedNetworkImage(
                      imageUrl: widget.productModel.images[index],
                      placeholder: (_, s) {
                        return Image.asset(
                          AssetPath.placeholder,
                        );
                      },
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  itemCount: widget.productModel.images.length,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: widget.productModel.images.length,
            effect: const ExpandingDotsEffect(
              dotHeight: 12,
              dotWidth: 15,
              activeDotColor: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        widget.productModel.name,
                        style: const TextStyle(
                          fontSize: 28,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !(widget.productModel.discount == 0),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          '-${widget.productModel.discount.toString()} %',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${widget.productModel.price.toStringAsFixed(2)} AUD',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.productModel.name,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1.5,
            height: 0,
          ),
          ExpansionPanelList.radio(elevation: 0, children: [
            ExpansionPanelRadio(
              canTapOnHeader: true,
              backgroundColor: Colors.transparent,
              value: UniqueKey(),
              headerBuilder: (BuildContext context, bool isExpanded) {
                return const ListTile(
                  title: Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                );
              },
              body: ListTile(
                  title: Text(widget.productModel.description), onTap: () {}),
              // isExpanded: item.isExpanded,
            )
          ])
        ],
      )),
      bottomNavigationBar: Container(
        height: 90,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 21),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: const Offset(0, -5),
            color: Colors.grey.shade300,
            blurRadius: 10,
          )
        ]),
        child: Row(
          children: [
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) => IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    homeProvider.favoriteId.contains(widget.productModel.id)
                        ? homeProvider.deleteFavorite(
                            id: widget.productModel.id)
                        : homeProvider.addFavorite(id: widget.productModel.id);
                    // setState(() {});
                  },
                  icon: Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: homeProvider.favoriteId
                              .contains(widget.productModel.id)
                          ? Colors.green
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      AssetPath.favoriteIcon,
                      color: homeProvider.favoriteId
                              .contains(widget.productModel.id)
                          ? Colors.white
                          : Colors.black54,
                    ),
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomElevatedButton(
                text: 'Add To Cart',
                onPressed: () {},
                isLoading: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
