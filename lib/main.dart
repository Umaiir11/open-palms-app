import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_palms/app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(OpenPalmsApp());

  // runApp(
  //   DevicePreview(
  //     enabled: true, // Only enable in debug/profile mode
  //     builder: (context) => ProxixApp(), // Your main app
  //   ),
  // );
}
