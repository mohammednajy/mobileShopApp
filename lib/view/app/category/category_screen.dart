import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop_application/provider/category_provider.dart';
import 'package:mobile_shop_application/router/router_services.dart';
import 'package:mobile_shop_application/router/screen_name.dart';
import 'package:mobile_shop_application/utils/constant.dart';
import 'package:mobile_shop_application/view/app/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CategoryProvider>().getCategories();
    });
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
        title: const Text(
          'Category',
          style: TextStyle(
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
                      items: 5,
                      childAspectRatio: 4 / 5,
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
                            categoryProvider.searchCategory(value);
                          },
                        ),
                        searchController.text.isNotEmpty &&
                                categoryProvider.searchCategories.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Text(
                                  'There is no category',
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Expanded(
                                child: GridView.builder(
                                  padding: const EdgeInsets.only(top: 20),
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 4 / 5,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemBuilder: (_, index) => InkWell(
                                    onTap: () {
                                      AppRouter.goTo(
                                        ScreenName.productsScreen,
                                        arguments:
                                            searchController.text.isNotEmpty
                                                ? categoryProvider
                                                    .searchCategories[index]
                                                : categoryProvider
                                                    .categories[index],
                                      );
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: searchController
                                                      .text.isNotEmpty
                                                  ? categoryProvider
                                                      .searchCategories[index]
                                                      .image
                                                  : categoryProvider
                                                      .categories[index].image,
                                              height: 110,
                                              width: 100,
                                              placeholder: (context, _) =>
                                                  SkeletonLoader(
                                                      builder: Container(
                                                height: 100,
                                                width: 80,
                                                color: Colors.white,
                                              )),
                                              fit: BoxFit.fill,
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            FittedBox(
                                              child: Text(
                                                searchController.text.isNotEmpty
                                                    ? categoryProvider
                                                        .searchCategories[index]
                                                        .name
                                                    : categoryProvider
                                                        .categories[index].name,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            // const SizedBox(
                                            //   height: 10,
                                            // ),
                                            // const Text(
                                            //   '36 items',
                                            //   style: TextStyle(
                                            //     fontSize: 12,
                                            //     color: Colors.grey,
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemCount: searchController.text.isNotEmpty
                                      ? categoryProvider.searchCategories.length
                                      : categoryProvider.categories.length,
                                ),
                              ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
