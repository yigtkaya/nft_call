import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/components/kt_text_field.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/theme/theme_manager.dart';
import 'package:nft_call/core/constants/vertical_space.dart';
import 'package:nft_call/view/login/login_view_model.dart';
import 'package:nft_call/view/login/reset_password_view.dart';
import 'package:nft_call/view/login/sign_up_view.dart';
import 'package:nft_call/view/root/root_view.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/constants/theme/color/gradient_colors.dart';
import '../../core/constants/theme/styles.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';

class LoginView extends BaseView<LoginView, LoginViewModel> {
  LoginView({Key? key}) : super(key: key) {
    initViewModel(LoginViewModel());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  ColorConstants
                      .colorPlateList[
                          7 % (ColorConstants.colorPlateList.length)]
                      .startColor,
                  ColorConstants
                      .colorPlateList[
                          7 % (ColorConstants.colorPlateList.length)]
                      .endColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 1.2],
                tileMode: TileMode.clamp),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Align(
                    alignment: Alignment.center,
                    child: DTText(
                      label: "Sign In",
                      style: context.bold20,
                      color: Colors.white,
                    )),
                const VerticalSpace(
                  spaceAmount: 20,
                ),
                KTTextField(
                  textController: viewModel.emailController,
                  title: "Email",
                ),
                const VerticalSpace(
                  spaceAmount: 20,
                ),
                KTTextField(
                  textController: viewModel.paswordController,
                  title: "Pasword",
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xff364d64),
                    ),
                    onPressed: () {
                      viewModel.navigateToForgotPassword();
                    },
                    child: const Text('Forgot Password ?', style: KTLabelStyle),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        value: true,
                        side: const BorderSide(color: Colors.white),
                        checkColor: Colors.white,
                        activeColor: const Color(0xff364d64),
                        onChanged: (isSelected) {}),
                    const DTText(
                      label: "Remember me",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xff364d64),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      onPressed: () {
                        viewModel.signIn(viewModel.emailController.text.trim(), viewModel.paswordController.text.trim());

                      },
                      child: const DTText(
                        label: "LOGIN",
                        color: Colors.black,
                        style: KTLabelStyle,
                      )),
                ),
                const VerticalSpace(
                  spaceAmount: 50,
                ),
                const Align(
                    alignment: Alignment.center,
                    child: DTText(label: "OR", style: KTLabelStyle)),
                const VerticalSpace(
                  spaceAmount: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 40, left: 50, right: 50),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFF4989D7),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                      onPressed: () {
                        viewModel.googleSignIn();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 35.0,
                            width: 30.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/google.png'),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: DTText(
                              label: "Sign in with Google",
                              color: ThemeManager.instance?.getCurrentTheme
                                  .colorTheme.colors.abbey,
                              style: KTLabelStyle,
                            ),
                          )
                        ],
                      )),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () => viewModel.navigateToSignUp(),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: 'Don\'t have an Account? ',
                                style: KTLabelStyle),
                            TextSpan(text: 'Sign Up', style: KTLabelStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.login, screenName: ScreenName.login);
  }
}
