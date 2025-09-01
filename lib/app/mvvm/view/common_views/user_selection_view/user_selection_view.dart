import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/app_assets.dart';

class UserSelectionView extends StatefulWidget {
  const UserSelectionView({super.key});

  @override
  State<UserSelectionView> createState() => _UserSelectionViewState();
}

class _UserSelectionViewState extends State<UserSelectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.getStartedBg), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
