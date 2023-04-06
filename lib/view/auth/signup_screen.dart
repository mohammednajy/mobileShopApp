import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_shop_application/view/shared/button/custome_elevated_button.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import '../../router/router_services.dart';
import '../../router/screen_name.dart';
import '../../utils/constant.dart';
import '../shared/text/header_text_custom.dart';
import '../shared/text/rich_text_custom.dart';
import '../shared/textfield/text_field_custom.dart';
import '../../utils/validation.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
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
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 45),
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
                    ),
                    Expanded(
                      flex: 9,
                      child: Column(
                        children: [
                          TextFieldCustom(
                            controller: nameController,
                            icon: AssetPath.userIcon,
                            hintText: 'Full name',
                            validator: (nameValue) {
                              return nameValue!.isValidName;
                            },
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          TextFieldCustom(
                            controller: emailController,
                            icon: AssetPath.emailIcon,
                            hintText: 'Email',
                            validator: (emailValue) {
                              return emailValue!.isValidEmail;
                            },
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          TextFieldCustom(
                            controller: phoneController,
                            icon: AssetPath.mobileIcon,
                            hintText: 'Phone ',
                            validator: (emailValue) {
                              // return emailValue!.isValidPhone;
                            },
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          TextFieldCustom(
                            obscureText: true,
                            controller: passwordController,
                            icon: AssetPath.passwordIcon,
                            hintText: 'Password',
                            validator: (passwordValue) {
                              return passwordValue!.isValidPassword;
                            },
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          TextFieldCustom(
                              obscureText: true,
                              controller: confirmPasswordController,
                              icon: AssetPath.passwordIcon,
                              hintText: 'Confirm password',
                              validator: (confirmPasswordValue) {
                                if (confirmPasswordValue!.isEmpty) {
                                  return 'required field';
                                } else if (confirmPasswordValue !=
                                    passwordController.text) {
                                  return 'Not match';
                                }
                                return null;
                              }),
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
                      child: Consumer<AuthProvider>(
                        builder: (context, authValue, child) => Column(
                          children: [
                            CustomElevatedButton(
                              text: 'Sign Up',
                              isLoading: authValue.isLoading,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  authValue.singUp(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                                // context.setLocale(Locale('en'));
                              },
                            ),
                            const Spacer(),
                            Center(
                              child: RichTextCustom(
                                leftText: 'Have an account? ',
                                rightText: 'Log In',
                                onTap: () =>
                                    AppRouter.goTo(ScreenName.loginScreen),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    ));
  }
}
