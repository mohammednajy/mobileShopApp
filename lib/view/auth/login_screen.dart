// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import '../../router/router_services.dart';
import '../../router/screen_name.dart';
import '../../utils/constant.dart';
import '../../utils/locale_keys.g.dart';
import '../shared/button/custome_elevated_button.dart';
import '../shared/text/header_text_custom.dart';
import '../shared/text/rich_text_custom.dart';
import '../shared/textfield/text_field_custom.dart';
import '../../utils/validation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              HeaderTitleCustom(
                leftText: LocaleKeys.welcome.tr(),
                rightText: LocaleKeys.back.tr(),
                size: 30,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFieldCustom(
                controller: _emailController,
                validator: (emailValue) {
                  return emailValue!.isValidEmail;
                },
                icon: AssetPath.userIcon,
                hintText: 'example@gmail.com',
              ),
              const SizedBox(
                height: 14,
              ),
              TextFieldCustom(
                obscureText: true,
                controller: _passwordController,
                validator: (passwordValue) {
                  return passwordValue!.isValidPassword;
                },
                icon: AssetPath.passwordIcon,
                hintText: LocaleKeys.password.tr(),
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
                      '${LocaleKeys.forget_password.tr()} ?',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 13),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<AuthProvider>(
                builder: (context, authProvider, child) => CustomElevatedButton(
                  isLoading: authProvider.loading,
                  onPressed: () {
                    print(authProvider.loading);
                    if (_formKey.currentState!.validate()) {
                      authProvider.login(
                          email: _emailController.text,
                          password: _passwordController.text);
                    }
                  },
                  text: LocaleKeys.login.tr(),
                ),
              ),
              const Spacer(),
              Center(
                child: RichTextCustom(
                  leftText: '${LocaleKeys.haven_not_an_account.tr()}?  ',
                  rightText: LocaleKeys.singUp.tr(),
                  onTap: () {
                    AppRouter.goTo(ScreenName.signUpScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
