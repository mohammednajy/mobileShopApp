import 'package:flutter/material.dart';

class HeaderTitleCustom extends StatelessWidget {
  const HeaderTitleCustom({
    required this.leftText,
    required this.rightText,
    this.size = 40,
    Key? key,
  }) : super(key: key);
  final String leftText;
  final String rightText;
  final double size;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: leftText,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: size),
            children: [
          TextSpan(
              text: rightText,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.green, fontSize: size))
        ]));
  }
}

