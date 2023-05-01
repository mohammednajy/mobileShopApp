import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop_application/utils/constant.dart';
import 'package:mobile_shop_application/utils/locale_keys.g.dart';
import 'package:mobile_shop_application/view/app/category/category_screen.dart';
import 'package:mobile_shop_application/view/app/home/home_screen.dart';

class HomeAppScreen extends StatefulWidget {
  const HomeAppScreen({super.key});

  @override
  State<HomeAppScreen> createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<HomeAppScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: icons
                .map((value) => BottomNavigationBarItem(
                      icon: BottomNavigationBarItemCustom(
                        selectedIndex: selectedIndex,
                        icon: value,
                        index: icons.indexOf(value),
                      ),
                      label: '',
                    ))
                .toList(),
            showSelectedLabels: false,
            enableFeedback: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
      body: taps[selectedIndex],
    );
  }
}

List<String> icons = [
  AssetPath.homeIcon,
  AssetPath.buyIcon,
  AssetPath.discoverIcon,
  AssetPath.starIcon,
  AssetPath.profileIcon,
];
List<Widget> taps = [
  const HomeScreen(),
  const Center(
    child: Text('1'),
  ),
  const CategoryScreen(),
  const Center(
    child: Text('3'),
  ),
  const Center(
    child: Text('4'),
  ),
];

class BottomNavigationBarItemCustom extends StatelessWidget {
  const BottomNavigationBarItemCustom(
      {Key? key,
      required this.selectedIndex,
      required this.index,
      required this.icon})
      : super(key: key);

  final int selectedIndex;
  final int index;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: selectedIndex == index ? Colors.green : Colors.white,
      ),
      child: Image.asset(
        icon,
        color: selectedIndex == index ? Colors.white : null,
      ),
    );
  }
}
