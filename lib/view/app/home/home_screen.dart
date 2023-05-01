import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop_application/provider/category_provider.dart';
import 'package:mobile_shop_application/provider/home_provider.dart';
import 'package:mobile_shop_application/router/router_services.dart';
import 'package:mobile_shop_application/router/screen_name.dart';
import 'package:mobile_shop_application/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import '../../../utils/responsive.dart';

import '../../shared/loading/home_loading.dart';
import 'component/banners_section.dart';
import 'component/category_section.dart';
import 'component/product_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeProvider>().getBanners();
      context.read<CategoryProvider>().getCategories();
      context.read<HomeProvider>().getHomeData();
      context.read<HomeProvider>().getFavorite();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 25),
          icon: Image.asset(
            AssetPath.categoryIcon,
            height: 24,
            width: 24,
          ),
          onPressed: () {
            AppRouter.goTo(ScreenName.categoryScreen);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 25),
            icon: Image.asset(
              AssetPath.notificationIcon,
              height: 24,
              width: 24,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) => RefreshIndicator(
          onRefresh: () => Future.wait([
            context.read<HomeProvider>().getBanners(),
            context.read<CategoryProvider>().getCategories(),
            context.read<HomeProvider>().getHomeData(),
            context.read<HomeProvider>().getFavorite(),
          ]),
          color: Colors.white,
          backgroundColor: Colors.green,
          strokeWidth: 3.0,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: Column(
                children: [
                  const SearchSection(),
                  SizedBox(
                    height: kHeight(context) * 0.04,
                  ),
                  homeProvider.loading
                      ? const LoadingCustomWidget()
                      : const BannersSection(),
                  SizedBox(
                    height: kHeight(context) * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Category',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            AppRouter.goTo(ScreenName.categoryScreen);
                          },
                          child: const Text(
                            'See All',
                            style: TextStyle(color: Colors.green, fontSize: 11),
                          ))
                    ],
                  ),
                  homeProvider.loading
                      ? const CategoryLoading()
                      : const CategorySection(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular Item',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            AppRouter.goTo(ScreenName.categoryScreen);
                          },
                          child: const Text(
                            'See All',
                            style: TextStyle(color: Colors.green, fontSize: 11),
                          ))
                    ],
                  ),
                  homeProvider.homeProductLoading
                      ? SkeletonGridLoader(
                          items: 4,
                          builder: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3)),
                          ),
                        )
                      : const ProductSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({
    this.onChanged,
    this.controller,
    Key? key,
  }) : super(key: key);
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(0, 10),
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4)
      ]),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: SvgPicture.asset(
            AssetPath.searchIcon,
            color: Colors.grey,
            fit: BoxFit.scaleDown,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.green,
            ),
          ),
          hintText: 'Search',
        ),
      ),
    );
  }
}
