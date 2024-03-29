import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/horizontal_space.dart';
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
                    .colorPlateList[7 % (ColorConstants.colorPlateList.length)]
                    .startColor,
                ColorConstants
                    .colorPlateList[7 % (ColorConstants.colorPlateList.length)]
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
                  const VerticalSpace(
                    spaceAmount: 20,
                  ),
                  DTText(label: "Email", style: context.semiBold14,color: Colors.white,),
                  KTTextField(
                    textController: viewModel.emailController,
                    title: "Email",
                  ),
                  Obx(() => DTText(
                      label: viewModel.errorMessage ?? "",
                      style: context.regular12,
                      color: Colors.red)),
                  const VerticalSpace(
                    spaceAmount: 20,
                  ),
                  DTText(label: "Password", style: context.semiBold14,color: Colors.white,),
                  KTTextField(
                    textController: viewModel.passwordController,
                    title: "Password",
                  ),
                  Obx(() => DTText(
                      label: viewModel.pwErrorMessage ?? "",
                      style: context.regular12,
                      color: Colors.red)),
                  const VerticalSpace(
                    spaceAmount: 20,
                  ),
                  DTText(label: "Confirm Password", style: context.semiBold14,color: Colors.white,),
                  KTTextField(
                    textController: viewModel.confirmPasswordController,
                    title: "Confirm Password",
                  ),
                  Obx(() => DTText(
                      label: viewModel.confirmPwErrorMessage ?? "",
                      style: context.regular12,
                      color: Colors.red)),
                  const VerticalSpace(
                    spaceAmount: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
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
                            viewModel.validateEmail();
                            viewModel.validatePassword();
                            viewModel.validateConfirmPassword();

                            if (viewModel.errorMessage == "" &&
                                viewModel.pwErrorMessage == "" &&
                                viewModel.confirmPwErrorMessage == "") {
                              viewModel.signUp(
                                  viewModel.emailController.text.trim(),
                                  viewModel.passwordController.text.trim());
                            }
                          },
                          child: DTText(
                            label: "SIGN UP",
                            color: Colors.blue,
                            style: context.semiBold16,
                          )),
                    ),
                  ),
                  const VerticalSpace(
                    spaceAmount: 40,
                  ),
                  const Align(
                      alignment: Alignment.center,
                      child: DTText(label: "OR", style: KTLabelStyle)),
                  const VerticalSpace(
                    spaceAmount: 40,
                  ),
                  Align(
                    alignment: Alignment.center,
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
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 35.0,
                              width: 30.0,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                    AssetImage('assets/images/google.png'),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const HorizontalSpace(),
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
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DTText(label: "Already have account?", style: context.regular16,color: Colors.white,),
                            const HorizontalSpace(spaceAmount: 5,),
                            GestureDetector(onTap: () => Get.offAll(() => LoginView()),
                                child: DTText(label: "Sign In", style: context.regular16, color: Colors.white,)),
                          ],
                        ),
                      )
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
        ViewInfoModel(menuKey: MenuKey.signUp, screenName: ScreenName.signUp);
  }
}
