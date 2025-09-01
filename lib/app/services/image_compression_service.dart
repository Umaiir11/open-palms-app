import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class ImageCompressionService {
  /// Compresses an image [XFile] if it's a valid image.
  /// Returns the compressed [XFile], or the original if not compressible or fails.
  Future<XFile> compressImage(XFile file) async {
    try {
      final mimeType = lookupMimeType(file.path);
      if (mimeType == null || !mimeType.startsWith('image/')) {
        return file; // Not an image
      }

      final extension = path.extension(file.path).toLowerCase();
      final format = extension == '.png'
          ? CompressFormat.png : CompressFormat.jpeg;

      final tempDir = await getTemporaryDirectory();
      final targetPath = path.join(
        tempDir.path,
        '${DateTime.now().millisecondsSinceEpoch}_compressed$extension',
      );

      final XFile? compressed = await FlutterImageCompress.compressAndGetFile(
        file.path,
        targetPath,
        quality: 60,
        minWidth: 1080,
        minHeight: 1080,
        format: format,
      );

      return compressed ?? file;
    } catch (e, stackTrace) {
      print('⚠️ Error compressing image: $e\n$stackTrace');
      return file;
    }
  }
}
