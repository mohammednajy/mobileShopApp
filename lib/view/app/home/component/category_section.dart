import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/home_provider.dart';
import '../../../../utils/constant.dart';
class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => SizedBox(
        height: 110,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
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
                child: FadeInImage.assetNetwork(
                  image: homeProvider.categories[index].image,
                  placeholder: AssetPath.placeholder,
                  fit: BoxFit.fill,
                  height: 60,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                homeProvider.categories[index].name.contains(' ')
                    ? ' ${homeProvider.categories[index].name.split(' ')[0]}\n ${homeProvider.categories[index].name.split(' ')[1]}'
                    : homeProvider.categories[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 15,
          ),
          itemCount: homeProvider.categories.length,
        ),
      ),
    );
  }
}
