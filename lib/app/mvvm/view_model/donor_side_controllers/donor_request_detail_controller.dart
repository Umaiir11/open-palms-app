import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DonorRequestDetailController extends GetxController {
  final List<String> images = [
    "https://images.unsplash.com/photo-1504384308090-c894fdcc538d",
    "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61",
    "https://images.unsplash.com/photo-1507679799987-c73779587ccf",
    "https://images.unsplash.com/photo-1551836022-d5d88e9218df",
  ];

  double calculatePercentage(String? totalAmount, String? collectedAmount) {
    if (totalAmount == null || collectedAmount == null) return 0;

    final total = double.tryParse(totalAmount) ?? 0;
    final collected = double.tryParse(collectedAmount) ?? 0;

    if (total <= 0) return 0;

    final percentage = (collected / total) * 100;
    return double.parse(percentage.toStringAsFixed(2));
  }

  /// Already existing
  var currentIndex = 0.obs;
  Timer? _timer;

  /// 🔹 Added for Upload Pictures carousel
  RxInt uploadCurrentIndex = 0.obs;
  Timer? autoScrollTimer;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 0.6);

    /// Auto change every 4 seconds (existing work)
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      currentIndex.value = (currentIndex.value + 1) % images.length;
    });
  }

  /// Already existing
  void changeImage(int index) {
    currentIndex.value = index;
  }
}
