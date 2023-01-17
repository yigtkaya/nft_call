import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/view/login/reset_password_view_model.dart';
import 'package:nft_call/view/login/sign_up_view.dart';

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

class ResetPasswordView extends BaseView<ResetPasswordView, ResetPasswordViewModel> {
  ResetPasswordView({Key? key}) : super(key: key) {
    initViewModel(ResetPasswordViewModel());
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
                    Align(
                        alignment: Alignment.center,
                        child: DTText(
                          label: "Reset your password by filling in your e-mail address. You will then receive an email with a link that will let you enter a new password.",
                          style: context.regular14,
                          color: Colors.white,
                        )),
                    const VerticalSpace(spaceAmount: 20,),
                    KTTextField(
                      textController: viewModel.emailController,
                      title: "Email",
                    ),
                    const VerticalSpace(spaceAmount: 20,),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xff364d64),
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                          onPressed: () {
                            Get.back();
                          },
                          child: const DTText(
                            label: "Send reset email",
                            color: Colors.black,
                            style: KTLabelStyle,
                          )),
                    ),
                    const VerticalSpace(
                      spaceAmount: 50,
                    ),
                    const VerticalSpace(
                      spaceAmount: 30,
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
        ViewInfoModel(menuKey: MenuKey.reset, screenName: ScreenName.reset);
  }
}