import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../utils/constant.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 1 / 5,
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: AppColor.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                )),
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          Container(
            width: 135,
            height: 50,
            margin: const EdgeInsets.only(left: 15),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: AppColor.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
                const Text(
                  '2',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
              ],
            ),
          )
        ],
      ),
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 15),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: const Color(0xFFECE9F1),
                borderRadius: BorderRadius.circular(15)),
            height: 100,
            width: 100,
            child: Image.asset(
              AssetPath.mobileImage,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Oneplus 9 prossssssss',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 16,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '876 AED',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          // const Spacer(),
          Expanded(
            child: Text(
              'x1',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ]),
      ),
    );
  }
}
