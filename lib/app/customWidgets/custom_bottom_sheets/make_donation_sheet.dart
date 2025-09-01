import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/app_assets.dart';
import 'package:open_palms/app/config/app_text_style.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/app_custom_field.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

import '../../config/app_colors.dart';
import '../../mvvm/view_model/donor_side_controllers/donor_request_detail_controller.dart';
import '../app_custom_button.dart';

class MakeDonationSheet extends StatefulWidget {
  const MakeDonationSheet({super.key});

  @override
  State<MakeDonationSheet> createState() => _MakeDonationSheetState();
}

class _MakeDonationSheetState extends State<MakeDonationSheet> {
  final DonorRequestDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          15.h.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(AppAssets.closeIcon),
              ),
            ],
          ),
          Text(
            'Make a Donation',
            style: AppTextStyles.customText20(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          20.h.height,
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: controller.amounts.map((category) {
                return GestureDetector(
                  onTap: () => controller.selectAmount(category),
                  child: Obx(() {
                    final isSelected = controller.selectedAmount.value == category;

                    // calculate exact width for 3 columns
                    final double totalSpacing = 2 * 10.w; // 2 gaps between 3 items
                    final double childWidth = (Get.width - totalSpacing - 40.w) / 3;
                    // 👆 subtract extra 40.w if you have side padding in your parent.
                    // If not, remove `- 40.w`.

                    return Container(
                      width: childWidth,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary.withOpacity(0.8) : const Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(6.sp),
                        border: Border.all(color: AppColors.black.withOpacity(0.06)),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Center(
                        child: Text(
                          "\$$category",
                          style: AppTextStyles.customText16(fontWeight: FontWeight.w500, color: isSelected ? AppColors.white : AppColors.black),
                        ),
                      ),
                    );
                  }),
                );
              }).toList(),
            ),
          ),
          15.h.height,
          AppCustomField(
            isSecondField: true,
            titleWidget: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Custom Amount',
                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
            hintText: 'Enter Amount',
          ),
          10.h.height,
          AppCustomField(
            isSecondField: true,
            titleWidget: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Anonymous Message (Optional)',
                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
            maxLines: 5,
            minLines: 5,
            hintText: 'Send encouragement with emojis only...',
            textInputAction: TextInputAction.done,
          ),
          10.h.height,
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Messages Are Limited To Emojis To Protect Your Anonymity', style: AppTextStyles.customText14(color: Color(0xff777E90))),
          ),
          15.h.height,
          AppCustomButton(title: 'Donate', onPressed: () {}).paddingHorizontal(50.w),
          10.h.height,
          Text(
            "Your donation is secure and anonymous. Processing fee: 2.9% + \$0.30",
            textAlign: TextAlign.center,
            style: AppTextStyles.customText14(color: Colors.black, fontWeight: FontWeight.w500),
          ).paddingHorizontal(30.w),
          10.h.height,
        ],
      ).paddingHorizontal(15.w),
    );
  }
}
