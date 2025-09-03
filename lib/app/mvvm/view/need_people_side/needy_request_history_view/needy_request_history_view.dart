import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/custom_app_bar.dart';

import '../../../../config/app_routes.dart';
import '../../../../customWidgets/custom_tiles/request_custom_tile.dart';

class NeedyRequestHistoryView extends StatefulWidget {
  const NeedyRequestHistoryView({super.key});

  @override
  State<NeedyRequestHistoryView> createState() => _NeedyRequestHistoryViewState();
}

class _NeedyRequestHistoryViewState extends State<NeedyRequestHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Request History', backgroundColor: Colors.transparent),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 3,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return RequestCustomTile(
            onTap: () {
              Get.toNamed(AppRoutes.needyRequestDetailView, arguments: {'status': 'history'});
            },
            title: "Emergency Medical Surgery",
            image: "https://images.pexels.com/photos/8078574/pexels-photo-8078574.jpeg",
            collectedAmount: "18750",
            priority: "High",
            description:
                "Help Sarah with urgent medical expenses for her heart surgery. She needs immediate support to cover hospital bills and post-operative care. Sarah is a single mother of two who has been battling heart disease for the past year.",
            supporters: '235',
            totalAmount: "25000",
          ).paddingBottom(10.h);
        },
      ).paddingHorizontal(15.w),
    );
  }
}
