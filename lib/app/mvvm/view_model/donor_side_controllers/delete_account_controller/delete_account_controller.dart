import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DeleteAccountController extends GetxController {

  RxBool isVisible = true.obs;

  void togglePassword() {
    isVisible.value = !isVisible.value;
  }
  TextEditingController passwordController = TextEditingController();

}