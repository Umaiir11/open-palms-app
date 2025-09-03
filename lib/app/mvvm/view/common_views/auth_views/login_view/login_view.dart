import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/app_assets.dart';
import 'package:open_palms/app/config/app_strings.dart';
import 'package:open_palms/app/config/global_variables.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/app_custom_button.dart';
import 'package:open_palms/app/customWidgets/app_custom_field.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/app_routes.dart';
import '../../../../../config/app_text_style.dart';
import '../../../../view_model/common_controllers/auth_controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController authController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          /// Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              GestureDetector(onTap: () => Get.back(), child: SvgPicture.asset(AppAssets.whiteBackButton)),

              // Welcome Text Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome",
                    style: AppTextStyles.customText28(color: Color(0xFF94E941), fontWeight: FontWeight.bold, height: 1),
                  ),
                  4.height,
                  Text(
                    "To OpenPalms",
                    style: AppTextStyles.customText28(color: Colors.white, fontWeight: FontWeight.w700, height: 1),
                  ),
                  6.height,
                  Text(
                    "Your Help, Their Hope.",
                    style: AppTextStyles.customText14(color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w400),
                  ),
                ],
              ).paddingTop(10.h),
              SvgPicture.asset(AppAssets.whiteBackButton, color: Colors.transparent),
            ],
          ).paddingTop(50.h).paddingHorizontal(15.w),
          20.h.height,

          /// White rounded container
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: AppColors.white, // white container
                borderRadius: BorderRadius.only(topLeft: Radius.circular(14.r), topRight: Radius.circular(14.r)),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      GlobalVariables.userType == UserType.donor ? AppStrings.wantToDonateLabel : "I Want Help",
                      style: AppTextStyles.customText28(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    3.height,
                    Text(
                      "Make a difference by supporting verified\nrecipients in need",
                      style: AppTextStyles.customText14(color: Color(0xff979797), fontWeight: FontWeight.w400),
                    ),
                    30.height,

                    /// Email Field
                    AppCustomField(labelTitle: "Email Address", labelColor: AppColors.textColorBlackLight, hintText: "Enter your email", isRequired: false),
                    20.height,

                    /// Password Field
                    Obx(
                      () => AppCustomField(
                        labelTitle: "Password",
                        hintText: "Enter your password",
                        controller: authController.passwordController,
                        obscureText: authController.isVisible.value,
                        isRequired: false,
                        suffixIcon: IconButton(
                          icon: Icon(authController.isVisible.value ? Icons.visibility_off : Icons.visibility),
                          color: AppColors.toggleColor,
                          onPressed: authController.togglePassword,
                        ),
                      ),
                    ),
                    14.height,

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgotPasswordView);
                        },
                        child: Text("Forgot Password?", style: AppTextStyles.customText14(color: Colors.black)),
                      ),
                    ),
                    32.height,

                    /// Sign In Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: AppCustomButton(
                        title: "Sign In",
                        bgColor: AppColors.secondary,
                        onPressed: () {
                          if (GlobalVariables.userType == UserType.donor) {
                            Get.offAllNamed(AppRoutes.donorBottomBarView);
                          } else {
                            Get.offAllNamed(AppRoutes.needyHomeView);
                          }
                        },
                      ),
                    ),
                    32.h.height,

                    /// Or Continue With
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "OR CONTINUE WITH",
                          style: AppTextStyles.customTextFigtree(color: Color(0xffCDCDCD), fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ],
                    ),
                    32.h.height,

                    /// Social Buttons (Google + Apple)
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [_socialIcon(AppAssets.googleLogo), 20.width, _socialIcon(AppAssets.appleLogo)]),
                    30.h.height,

                    /// Bottom Sign Up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Don’t have an account?", style: AppTextStyles.customText14(color: Colors.black)),
                        5.width,
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.signUpView);
                          },
                          child: Text(
                            "Sign Up",
                            style: AppTextStyles.customText16(color: AppColors.primary, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ).paddingHorizontal(15.w).paddingTop(20.h),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(String assetPath) {
    return Container(
      height: 48.h,
      width: 48.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(child: SvgPicture.asset(assetPath)),
    );
  }
}
