import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/custom_app_bar.dart';

import '../../../../config/app_routes.dart';
import '../../../../customWidgets/custom_tiles/request_custom_tile.dart';

class DonorHistoryView extends StatefulWidget {
  const DonorHistoryView({super.key});

  @override
  State<DonorHistoryView> createState() => _DonorHistoryViewState();
}

class _DonorHistoryViewState extends State<DonorHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'History',
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leading: SizedBox.shrink(),
        leadingWidth: 10.w,
      ), // 👈 Smooth entry for AppBar

      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 3,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return RequestCustomTile(
                onTap: () {
                  Get.toNamed(AppRoutes.donorRequestDetailView, arguments: {'status': 'history'});
                },
                isHistory: true,
                title: "Emergency Medical Surgery",
                image: "https://images.pexels.com/photos/8078574/pexels-photo-8078574.jpeg",
                collectedAmount: "18750",
                priority: "High",
                description:
                    "Help Sarah with urgent medical expenses for her heart surgery. She needs immediate support to cover hospital bills and post-operative care. Sarah is a single mother of two who has been battling heart disease for the past year.",
                supporters: '235',
                totalAmount: "25000",
              )
              .paddingBottom(10.h)
              .animate()
              .fadeIn(duration: 600.ms, delay: (index * 200).ms) // 👈 staggered fade-in
              .slideY(begin: 0.15, end: 0); // 👈 slides up slightly
        },
      ).paddingHorizontal(15.w),
    );
  }
}
