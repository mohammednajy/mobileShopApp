import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class RichTextCustom extends StatelessWidget {
  const RichTextCustom({
    Key? key,
    required this.leftText,
    required this.rightText,
    this.onTap,
  }) : super(key: key);
  final String leftText;
  final String rightText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: leftText,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w500),
        children: [
          TextSpan(
              text: rightText,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.green),
              recognizer: TapGestureRecognizer()..onTap = onTap)
        ],
      ),
    );
  }
}
