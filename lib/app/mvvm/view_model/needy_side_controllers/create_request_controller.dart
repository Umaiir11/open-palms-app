import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateRequestController extends GetxController {
  final ImagePicker picker = ImagePicker();
  Rx<File?> profileImage = Rx<File?>(null);
  RxList<File> images = <File>[].obs;
  final int maxImages = 4;
  RxString selectedPriority = 'High'.obs;
  List<String> priorityList = ['High', 'Medium', 'Low'];

  Future<bool> pickImageFromGalleryForList() async {
    try {
      if (images.length >= maxImages) {
        print('Maximum image limit ($maxImages) reached');
        return false;
      }
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        images.add(File(pickedFile.path));
        print('Image added: ${pickedFile.path}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
      return false;
    }
  }

  Future<bool> pickImageFromCameraForList() async {
    try {
      if (images.length >= maxImages) {
        print('Maximum image limit ($maxImages) reached');
        return false;
      }
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        images.add(File(pickedFile.path));
        print('Image added: ${pickedFile.path}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error picking image from camera: $e');
      return false;
    }
  }

  void removeImage(int index) {
    if (index >= 0 && index < images.length) {
      images.removeAt(index);
      print('Image removed at index: $index');
    }
  }
}
