import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/app_text_style.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';
import 'package:open_palms/app/mvvm/view/donor_side/donor_bottom_bar_view/donor_history_view.dart';
import 'package:open_palms/app/mvvm/view/donor_side/donor_bottom_bar_view/donor_home_view.dart';
import 'package:open_palms/app/mvvm/view/donor_side/donor_bottom_bar_view/donor_profile_view.dart';

import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../view_model/common_controllers/bottom_bar_controller/bottom_bar_controller.dart';

class DonorBottomBarView extends StatefulWidget {
  const DonorBottomBarView({super.key});

  @override
  State<DonorBottomBarView> createState() => _DonorBottomBarViewState();
}

class _DonorBottomBarViewState extends State<DonorBottomBarView> {
  final BottomBarController controller = Get.find();
  final List<Widget> pages = [DonorHomeView(), DonorHistoryView(), DonorProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: false,
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => buildBottomBar()),
    );
  }

  Widget buildBottomBar() {
    return SafeArea(
      child: Container(
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [BoxShadow(offset: Offset(0, -5.h), color: AppColors.black.withOpacity(.1), blurRadius: 10.sp)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildItem(AppAssets.donateIcon, "Donate", 0),
            buildItem(AppAssets.historyIcon, "History", 1),
            buildItem(AppAssets.profileIcon, "Profile", 2),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String? image, String title, int index) {
    final isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changeView(index),
      child: AnimatedContainer(
        height: 43.h,
        width: 100.w,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(color: isSelected ? AppColors.secondary : AppColors.transparent, borderRadius: BorderRadius.circular(8.sp)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image ?? '', color: isSelected ? AppColors.white : AppColors.black, height: 22.h),
              5.w.width,
              Text(
                title,
                style: AppTextStyles.customText14(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
