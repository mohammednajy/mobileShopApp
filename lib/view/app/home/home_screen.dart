import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_shop_application/provider/home_provider.dart';
import 'package:mobile_shop_application/utils/constant.dart';
import 'package:mobile_shop_application/view/shared/textfield/text_field_custom.dart';
import 'package:provider/provider.dart';
import '../../../utils/responsive.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE5E5E5),
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
          onPressed: () {},
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
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        children: [
          TextField(
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
          SizedBox(
            height: kHeight(context) * 0.04,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 180,
              autoPlay: true,
              autoPlayInterval: const Duration(
                seconds: 3,
              ),
            ),
            items: context.watch<HomeProvider>().banners.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              i,
                            )),
                        borderRadius: BorderRadius.circular(
                          6,
                        )),
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
