import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/global_variables.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
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
          /* --- Header Section --- */
          Padding(
            padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: SvgPicture.asset(AppAssets.whiteBackButton),
                ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.3, curve: Curves.easeOut),

                16.h.height,

                Text(
                  'Sign Up',
                  style: AppTextStyles.customText24(color: Colors.white, fontWeight: FontWeight.w600),
                ).animate().fadeIn(duration: 500.ms, delay: 200.ms).slideY(begin: -0.2),

                4.h.height,

                Text(
                  'Complete the form and join Donate',
                  style: AppTextStyles.customText14(color: Colors.white, fontWeight: FontWeight.w400, height: 1),
                ).animate().fadeIn(duration: 500.ms, delay: 300.ms).slideY(begin: -0.1),
              ],
            ),
          ),

          16.h.height,

          /* --- Content --- */
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(14.r), topRight: Radius.circular(14.r)),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* --- First & Last Name --- */
                      Row(
                        children: [
                          Expanded(
                            child: AppCustomField(labelTitle: 'First Name', hintText: 'Enter first name', isRequired: false),
                          ).animate().fadeIn(duration: 400.ms, delay: 200.ms).slideY(begin: 0.2),
                          15.w.width,
                          Expanded(
                            child: AppCustomField(labelTitle: 'Last Name', hintText: 'Enter last name', isRequired: false),
                          ).animate().fadeIn(duration: 400.ms, delay: 300.ms).slideY(begin: 0.2),
                        ],
                      ),

                      20.h.height,

                      AppCustomField(
                        labelTitle: 'Email Address',
                        hintText: 'Enter your email',
                        isRequired: false,
                      ).animate().fadeIn(duration: 400.ms, delay: 400.ms).slideY(begin: 0.2),

                      20.h.height,

                      Obx(
                        () => AppCustomField(
                          labelTitle: 'Password',
                          hintText: 'Enter your password',
                          controller: authController.passwordController,
                          obscureText: authController.isVisible.value,
                          isRequired: false,
                          suffixIcon: GestureDetector(
                            onTap: authController.togglePassword,
                            child: Icon(authController.isVisible.value ? Icons.visibility_off : Icons.visibility, size: 20.sp, color: AppColors.textLightBlack),
                          ).paddingLeft(25.w),
                        ).animate().fadeIn(duration: 400.ms, delay: 500.ms).slideY(begin: 0.2),
                      ),

                      20.h.height,

                      Obx(
                        () => AppCustomField(
                          labelTitle: 'Confirm Password',
                          hintText: 'Re-enter your password',
                          controller: authController.confirmPasswordController,
                          obscureText: authController.isConfirmPasswordVisible.value,
                          isRequired: false,
                          suffixIcon: GestureDetector(
                            onTap: authController.toggleConfirmPassword,
                            child: Icon(
                              authController.isConfirmPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                              size: 20.sp,
                              color: AppColors.textLightBlack,
                            ),
                          ).paddingLeft(25.w),
                        ).animate().fadeIn(duration: 400.ms, delay: 600.ms).slideY(begin: 0.2),
                      ),

                      30.h.height,

                      /* --- Sign Up Button --- */
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
                            }
                          },
                        ).animate().fadeIn(duration: 600.ms, delay: 700.ms).scale(begin: const Offset(0.9, 0.9)),
                      ),

                      30.h.height,

                      /* --- Divider Text --- */
                      Center(
                        child: Text(
                          'OR CONTINUE WITH',
                          style: AppTextStyles.customTextFigtree(color: const Color(0xffCDCDCD), fontWeight: FontWeight.w500, fontSize: 18),
                        ).animate().fadeIn(duration: 500.ms, delay: 800.ms),
                      ),

                      30.h.height,

                      /* --- Social Icons --- */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialIcon(AppAssets.googleLogo).animate().fadeIn(duration: 500.ms, delay: 900.ms).scale(begin: const Offset(0.8, 0.8)),
                          20.w.width,
                          _socialIcon(AppAssets.appleLogo).animate().fadeIn(duration: 500.ms, delay: 1000.ms).scale(begin: const Offset(0.8, 0.8)),
                        ],
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
                      ).animate().fadeIn(duration: 500.ms, delay: 1100.ms).slideY(begin: 0.2),
                    ],
                  ),
                ),
              ),
            ).animate().fadeIn(duration: 500.ms, delay: 150.ms).slideY(begin: 0.3, curve: Curves.easeOut),
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
