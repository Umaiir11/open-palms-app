import 'package:get/get.dart';

class DonorHomeController extends GetxController {
  RxString selectedCategory = 'All'.obs;

  final List<String> categoryList = ["All", "Medical", "Education", "Food & Hunger", "Orphans", "Widows", "Disaster Relief", "Elderly Support"];

  void selectCategory(val){
    selectedCategory.value = val;
  }

}
