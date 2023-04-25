import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';


class LoadingCustomWidget extends StatelessWidget {
  const LoadingCustomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      items: 1,
      period: const Duration(seconds: 2),
      highlightColor: Colors.white,
      direction: SkeletonDirection.ltr,
      builder: Row(
        children: [
          Expanded(
            child: Container(
              height: 180,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          Expanded(
            child: Container(
              height: 180,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ],
      ),
    );
  }
}


class CategoryLoading extends StatelessWidget {
  const CategoryLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonGridLoader(
      items: 4,
      itemsPerRow: 4,
      crossAxisSpacing: 0,
      builder: Column(
        children: const [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
