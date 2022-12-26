import 'package:flutter/material.dart';
import 'package:mobile_shop_application/router/router_services.dart';
import 'package:mobile_shop_application/router/screen_name.dart';
import 'package:mobile_shop_application/utils/constant.dart';
import 'package:mobile_shop_application/view/shared/text/header_text_custom.dart';
import 'package:mobile_shop_application/view/shared/text/rich_text_custom.dart';
import 'package:mobile_shop_application/view/shared/textfield/text_field_custom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            const HeaderTitleCustom(
              leftText: 'Welcome',
              rightText: ' back!',
              size: 30,
            ),
            SizedBox(
              height: 40,
            ),
            TextFieldCustom(
              icon: AssetPath.userIcon,
              hintText: 'example@gmail.com',
            ),
            SizedBox(
              height: 14,
            ),
            TextFieldCustom(
              icon: AssetPath.passwordIcon,
              hintText: 'Password',
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerRight,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Forget password?',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 13),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Log in')),
            Spacer(),
            Center(
              child: RichTextCustom(
                leftText: 'Haven’t an account?',
                rightText: ' Sign up',
                onTap: () {
                  AppRouter.goAndRemove(ScreenName.signUpScreen);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
