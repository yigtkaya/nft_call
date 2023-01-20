import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/view/login/reset_password_view_model.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/components/kt_icon.dart';
import '../../core/components/kt_text_field.dart';
import '../../core/constants/asset.dart';
import '../../core/constants/dt_text.dart';
import '../../core/constants/theme/color/gradient_colors.dart';
import '../../core/constants/theme/styles.dart';
import '../../core/constants/vertical_space.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';

class ResetPasswordView
    extends BaseView<ResetPasswordView, ResetPasswordViewModel> {
  ResetPasswordView({Key? key}) : super(key: key) {
    initViewModel(ResetPasswordViewModel());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            ITIcon(
              iconName: AssetConstants.icons.cross,
              onPress: () => {Get.back()},
              color: Colors.white,
            ),
          ],
        ),
      ),
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
            child: Form(
              key: viewModel.addressFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: DTText(
                        label:
                            "Reset your password by filling in your e-mail address. You will then receive an email with a link that will let you enter a new password.",
                        style: context.regular14,
                        color: Colors.white,
                      )),
                  const VerticalSpace(
                    spaceAmount: 20,
                  ),
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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0xff364d64),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              bottom: 5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {
                          viewModel.validateEmail();
                          if (viewModel.errorMessage =="") {
                            // show toast message
                          }
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
      ),
    ));
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.reset, screenName: ScreenName.reset);
  }
}
