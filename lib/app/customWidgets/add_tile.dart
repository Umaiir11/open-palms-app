import 'package:custom_cached_image/custom_cached_image_with_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../config/app_colors.dart';

class AddTiles extends StatefulWidget {
  final String? image; // Can be a local file path (image or video) or network URL
  final Widget? centerWidget;
  final IconData? icon;
  final VoidCallback? onTap;
  final VoidCallback? onIconTap;
  final double? height;
  final double? width;
  final Color? iconBgColor;
  final Color? iconColor;
  final bool? hasEditIcon;

  const AddTiles({
    super.key,
    this.image,
    this.centerWidget,
    this.icon,
    this.onTap,
    this.onIconTap,
    this.height,
    this.width,
    this.iconBgColor,
    this.iconColor,
    this.hasEditIcon,
  });

  @override
  State<AddTiles> createState() => _AddTilesState();
}

class _AddTilesState extends State<AddTiles> {
  // Check if the path is a valid local file
  bool _isLocalFilePath(String? path) {
    if (path == null || path.isEmpty) {
      print('Path is null or empty: $path');
      return false;
    }
    try {
      File file = File(path);
      bool exists = file.existsSync();
      print('Checking file path: $path, exists: $exists');
      return exists;
    } catch (e) {
      print('Error checking file path: $e');
      return false;
    }
  }

  // Check if the file is a video based on extension
  bool _isVideoFile(String? path) {
    if (path == null || path.isEmpty) {
      print('Video path is null or empty: $path');
      return false;
    }
    final videoExtensions = ['.mp4', '.mov', '.avi', '.mkv', '.wmv'];
    bool isVideo = videoExtensions.any((ext) => path.toLowerCase().endsWith(ext));
    print('Checking if video file: $path, isVideo: $isVideo');
    return isVideo;
  }

  // Generate video thumbnail
  Future<Widget> _buildVideoThumbnail(String path) async {
    print('Attempting to generate thumbnail for: $path');
    try {
      final thumbnailPath = await VideoThumbnail.thumbnailFile(video: path, imageFormat: ImageFormat.JPEG, maxWidth: 200, quality: 75);
      if (thumbnailPath != null) {
        print('Thumbnail generated: $thumbnailPath');
        return Image.file(
          File(thumbnailPath),
          height: widget.height ?? 156.h,
          width: widget.width ?? double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            print('Error loading thumbnail file: $error');
            return Container(
              color: AppColors.white,
              child: Icon(Icons.video_library, color: AppColors.primary, size: 24.sp),
            );
          },
        );
      } else {
        print('Thumbnail path is null');
      }
    } catch (e) {
      print('Error generating thumbnail: $e');
    }
    // Fallback to video icon
    return Container(
      color: AppColors.white,
      child: Icon(Icons.video_library, color: AppColors.primary, size: 24.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Building AddTiles with image: ${widget.image}, centerWidget: ${widget.centerWidget != null}');
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            height: widget.height ?? 156.h,
            width: widget.width ?? double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffF6F6F6),
              borderRadius: BorderRadius.circular(12.sp),
              border: Border.all(color: AppColors.transparent),
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12.sp),
              child: Center(
                child:
                    widget.centerWidget ??
                    (_isLocalFilePath(widget.image)
                        ? (_isVideoFile(widget.image)
                              ? FutureBuilder<Widget>(
                                  future: _buildVideoThumbnail(widget.image!),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      print('Thumbnail loading for: ${widget.image}');
                                      return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary)));
                                    }
                                    if (snapshot.hasError) {
                                      print('FutureBuilder error: ${snapshot.error}');
                                      return Container(
                                        color: AppColors.white,
                                        child: Icon(Icons.error, color: AppColors.negativeRed, size: 24.sp),
                                      );
                                    }
                                    return snapshot.data ??
                                        Container(
                                          color: AppColors.white,
                                          child: Icon(Icons.video_library, color: AppColors.primary, size: 24.sp),
                                        );
                                  },
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12.sp),
                                  child: Image.file(
                                    File(widget.image!),
                                    height: widget.height ?? 156.h,
                                    width: widget.width ?? double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      print('Error loading image file: $error');
                                      return Container(
                                        color: AppColors.white,
                                        child: Icon(Icons.error, color: AppColors.negativeRed, size: 24.sp),
                                      );
                                    },
                                  ),
                                ))
                        : CustomCachedImage(
                            height: widget.height ?? 156.h,
                            width: widget.width ?? double.infinity,
                            imageUrl: widget.image ?? '',
                            borderRadius: 12.sp,
                            isProfile: false,
                          )),
              ),
            ),
          ),
        ),
        widget.hasEditIcon ?? false
            ? Positioned(
                bottom: 0,
                right: -2,
                child: Container(
                  decoration: BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
                  child: Container(
                    decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                    child: InkWell(
                      onTap: widget.onIconTap,
                      child: Icon(widget.icon ?? Icons.add, color: AppColors.white, size: 14.sp).paddingAll(4.sp),
                    ),
                  ).paddingAll(3.sp),
                ),
              )
            : Container(),
      ],
    );
  }
}
