import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../router/router_services.dart';
import '../../router/screen_name.dart';
import '../../utils/constant.dart';
import '../shared/text/header_text_custom.dart';
import '../shared/text/rich_text_custom.dart';
import '../shared/textfield/text_field_custom.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const HeaderTitleCustom(
                            leftText: 'Sign',
                            rightText: ' Up',
                          ),
                          Text(
                            'Create a new account!',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        TextFieldCustom(
                          icon: AssetPath.userIcon,
                          hintText: 'Full name',
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        TextFieldCustom(
                          icon: AssetPath.emailIcon,
                          hintText: 'Email or Phone ',
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        TextFieldCustom(
                          icon: AssetPath.passwordIcon,
                          hintText: 'Password',
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        TextFieldCustom(
                          icon: AssetPath.passwordIcon,
                          hintText: 'Confirm password',
                        ),
                        HookBuilder(builder: (context) {
                          final selected = useState<bool>(false);
                          return CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: selected.value,
                            activeColor: Colors.green,
                            contentPadding: EdgeInsets.zero,
                            onChanged: (value) =>
                                selected.value = value ?? false,
                            title: Text(
                              'Agree with trams and condition.',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 16),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Sign Up'),
                        ),
                        const Spacer(),
                        Center(
                          child: RichTextCustom(
                            leftText: 'Have an account? ',
                            rightText: 'Log In',
                            onTap: () =>
                                AppRouter.goAndRemove(ScreenName.loginScreen),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }
}
