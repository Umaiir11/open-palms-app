import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/global_variables.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

import '../../../../../config/app_assets.dart';
import '../../../../../config/app_colors.dart';
import '../../../../../config/app_routes.dart';
import '../../../../../config/app_strings.dart';
import '../../../../../config/app_text_style.dart';
import '../../../../../customWidgets/app_custom_button.dart';
import '../../../../../customWidgets/app_custom_field.dart';
import '../../../../view_model/common_controllers/auth_controllers/sign_up_controller.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final SignUpController authController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fixed the alignment issue here
          Padding(
            padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                GestureDetector(onTap: () => Get.back(), child: SvgPicture.asset(AppAssets.whiteBackButton)),
                16.h.height,
                // Title
                Text(
                  'Sign Up',
                  style: AppTextStyles.customText24(color: Colors.white, fontWeight: FontWeight.w600),
                ),
                4.h.height,
                // Subtitle
                Text(
                  'Complete the form and join Donate',
                  style: AppTextStyles.customText14(color: Colors.white, fontWeight: FontWeight.w400, height: 1),
                ),
              ],
            ),
          ),
          16.h.height,

          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(14.r), topRight: Radius.circular(14.r)),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* --- First Name --- */
                    Row(
                      children: [
                        Expanded(
                          child: AppCustomField(labelTitle: 'First Name', hintText: 'Enter first name', isRequired: false),
                        ),
                        15.w.width,
                        Expanded(
                          child: AppCustomField(labelTitle: 'Last Name', hintText: 'Enter last name', isRequired: false),
                        ),
                      ],
                    ),

                    20.h.height,

                    /* --- Email --- */
                    AppCustomField(labelTitle: 'Email Address', hintText: 'Enter your email', isRequired: false),
                    20.h.height,

                    /* --- Password --- */
                    Obx(
                      () => AppCustomField(
                        labelTitle: 'Password',
                        hintText: 'Enter your password',
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
                    20.h.height,

                    /* --- Confirm Password --- */
                    Obx(
                      () => AppCustomField(
                        labelTitle: 'Confirm Password',
                        hintText: 'Re-enter your password',
                        controller: authController.confirmPasswordController,
                        obscureText: authController.isConfirmPasswordVisible.value,
                        isRequired: false,
                        suffixIcon: IconButton(
                          icon: Icon(authController.isConfirmPasswordVisible.value ? Icons.visibility_off : Icons.visibility),
                          color: AppColors.toggleColor,
                          onPressed: authController.toggleConfirmPassword,
                        ),
                      ),
                    ),
                    30.h.height,

                    /* --- Sign-Up Button --- */
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: AppCustomButton(
                        title: 'Sign Up',
                        bgColor: AppColors.secondary,
                        onPressed: () {
                          if (GlobalVariables.userType == UserType.donor) {
                            Get.offAllNamed(AppRoutes.loginView);
                          } else if (GlobalVariables.userType == UserType.needy) {
                            Get.toNamed(AppRoutes.identityVerificationView);
                          } else {}
                        },
                      ),
                    ),
                    30.h.height,

                    /* --- OR CONTINUE WITH --- */
                    Center(
                      child: Text(
                        'OR CONTINUE WITH',
                        style: AppTextStyles.customTextFigtree(color: Color(0xffCDCDCD), fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                    30.h.height,

                    /* --- Social Icons --- */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_socialIcon(AppAssets.googleLogo), 20.w.width, _socialIcon(AppAssets.appleLogo)],
                    ),
                    30.h.height,

                    /* --- Bottom Row --- */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?', style: AppTextStyles.customText14(color: Colors.black)),
                        5.w.width,
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Text(
                            'Sign In',
                            style: AppTextStyles.customText16(color: AppColors.primary, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
