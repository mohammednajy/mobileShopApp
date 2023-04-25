import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop_application/data/localData/shared_pref.dart';
import 'package:mobile_shop_application/provider/home_provider.dart';
import 'package:mobile_shop_application/router/router_services.dart';
import 'package:mobile_shop_application/router/screen_name.dart';
import 'package:mobile_shop_application/utils/constant.dart';
import 'package:mobile_shop_application/view/shared/textfield/text_field_custom.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import '../../../utils/responsive.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      context.read<HomeProvider>().getCategories();
      context.read<HomeProvider>().getHomeData();
      context.read<HomeProvider>().getFavorite();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(context.watch<HomeProvider>().homeProductLoading);
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
            SharedPrefController().clear();
            AppRouter.goAndRemove(ScreenName.loginScreen);
          },
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
        builder: (context, homeProvider, child) => SingleChildScrollView(
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
                  height: kHeight(context) * 0.04,
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
                        onPressed: () {},
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
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({
    Key? key,
  }) : super(key: key);

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
