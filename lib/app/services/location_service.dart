// import 'logger_service.dart';
//
// /// Service for retrieving the user's current location.
// class LocationService {
//   /// Retrieves the current location of the user.
//   /// Returns a [Position] with latitude and longitude.
//   /// Throws [Exception] with detailed messages on failure.
//   Future<Position> getCurrentLocation() async {
//     // Step 1: Check if location services are enabled
//     final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!isServiceEnabled) {
//       LoggerService.w('Location services are disabled');
//       await Geolocator.openLocationSettings();
//       throw Exception('Location services are disabled.');
//     }
//
//     // Step 2: Check permission status
//     var permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       LoggerService.d('Requesting location permission');
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         LoggerService.w('Location permission denied');
//         throw Exception('Location permission denied.');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       LoggerService.w('Location permission permanently denied');
//       await openAppSettings();
//       throw Exception(
//           'Location permission permanently denied. Please enable it in app settings.');
//     }
//
//     // Step 3: Get current position
//     try {
//       final position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       LoggerService.i(
//           'Location retrieved: ${position.latitude}, ${position.longitude}');
//       return position;
//     } catch (e) {
//       LoggerService.e('Error fetching location: $e');
//       throw Exception('Error fetching location: $e');
//     }
//   }
// }
