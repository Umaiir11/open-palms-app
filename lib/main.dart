

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'app/app_widget.dart';

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
