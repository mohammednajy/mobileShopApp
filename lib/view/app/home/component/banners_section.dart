import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import '../../../../provider/home_provider.dart';

class BannersSection extends StatelessWidget {
  const BannersSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => CarouselSlider(
        options: CarouselOptions(
          height: 180,
          autoPlay: true,
          autoPlayInterval: const Duration(
            seconds: 3,
          ),
        ),
        items: homeProvider.banners.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                  6,
                )),
                child: Image.network(
                  i,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return SkeletonLoader(
                        builder: Container(
                      color: Colors.white,
                      height: 180,
                    ));
                  },
                  errorBuilder: (context, child, loadingProgress) {
                    return const Icon(
                      Icons.error,
                      size: 30,
                    );
                  },
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
