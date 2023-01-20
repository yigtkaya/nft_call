import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/view/login/login_view.dart';
import 'package:nft_call/view/login/sign_up_view_model.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/components/kt_text_field.dart';
import '../../core/constants/dt_text.dart';
import '../../core/constants/theme/color/gradient_colors.dart';
import '../../core/constants/theme/styles.dart';
import '../../core/constants/theme/theme_manager.dart';
import '../../core/constants/vertical_space.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';

class SignUpView extends BaseView<SignUpView, SignUpViewModel> {
  SignUpView({Key? key}) : super(key: key) {
    initViewModel(SignUpViewModel());
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
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: viewModel.addressFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Align(
                          alignment: Alignment.center,
                          child: DTText(
                            label: "Sign Up",
                            style: context.bold20,
                            color: Colors.white,
                          )),
                      const VerticalSpace(spaceAmount: 20,),
                      const DTText(label: "Email", style: KTLabelStyle),
                      KTTextField(
                        textController: viewModel.emailController,
                        title: "Email",
                      ),
                      const VerticalSpace(spaceAmount: 30,),
                      const DTText(label: "Password", style: KTLabelStyle),
                      KTTextField(
                        textController: viewModel.passwordController,
                        title: "Password",
                      ),
                      const VerticalSpace(spaceAmount: 20,),
                      const DTText(label: "Confirm Password", style: KTLabelStyle),
                      KTTextField(
                        textController: viewModel.confirmPasswordController,
                        title: "Confirm Password",
                      ),
                      const VerticalSpace(spaceAmount: 50,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: const Color(0xFF4989D7),
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            onPressed: () {
                              viewModel.signUp(viewModel.emailController.text.trim(), viewModel.passwordController.text.trim());
                            },
                            child: const DTText(
                              label: "SIGN UP",
                              color: Colors.blue,
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
                        padding: const EdgeInsets.only(bottom: 40, left: 50, right: 50),
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
                            onTap: () => Get.offAll(() => LoginView()),
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Already have account? ',
                                      style: KTLabelStyle
                                  ),
                                  TextSpan(
                                      text: 'Sign In',
                                      style: KTLabelStyle
                                  ),
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
          ),
        ));
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.signUp, screenName: ScreenName.signUp);  }
}