import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_palms/app/services/logger_service.dart';

class SignUpController extends GetxController {
  final ImagePicker picker = ImagePicker();
  Rx<File?> nationalIdFront = Rx<File?>(null);
  Rx<File?> nationalIdBack = Rx<File?>(null);
  Rx<File?> passportImage = Rx<File?>(null);
  Rx<File?> licenseImage = Rx<File?>(null);
  RxString imageType = ''.obs;

  RxBool isVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;

  void toggleConfirmPassword() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void togglePassword() {
    isVisible.value = !isVisible.value;
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // --------------------- Image Picker ---------------------
  Future<bool> pickImageFromGallery({required Rx<File?> file}) async {
    try {
      file.value = null;
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        file.value = File(pickedFile.path);
        return true;
      }
      return false;
    } catch (e) {
      LoggerService.e('Error picking image: $e');
      return false;
    }
  }

  Future<bool> pickImageFromCamera({required Rx<File?> file}) async {
    try {
      file.value = null;
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        file.value = File(pickedFile.path);
        return true;
      }
      return false;
    } catch (e) {
      LoggerService.e('Error picking image: $e');
      return false;
    }
  }
}
