import 'package:get/get.dart';

class DonorHomeController extends GetxController {
  RxString selectedCategory = 'All'.obs;

  final List<String> categoryList = ["All", "Medical", "Education", "Business", "Community"];

  void selectCategory(val) {
    selectedCategory.value = val;
  }
}
