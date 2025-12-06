// import 'dart:async';

// import 'package:location/location.dart';

// class LocationService {
//   late Location location = Location();
//   StreamSubscription<LocationData>? locationSubscription;

//   Future<void> checkAndRequestLocationService() async {
//     bool isServiceEnanled = await location.serviceEnabled();
//     if (!isServiceEnanled) {
//       isServiceEnanled = await location.requestService();
//       if (!isServiceEnanled) {
//         throw LocationServiceException();
//       }
//     }
//   }

//   Future<void> checkAndRequestLocationPermission() async {
//     PermissionStatus permissionStatus = await location.hasPermission();
//     if (permissionStatus == PermissionStatus.deniedForever) {
//       throw LocationPermissionException();
//     }
//     if (permissionStatus == PermissionStatus.denied) {
//       permissionStatus = await location.requestPermission();
//       if (permissionStatus != PermissionStatus.granted) {
//         throw LocationPermissionException();
//       }
//     }
//   }

//   void getRealTimeLocationData(void Function(LocationData)? onData) async {
//     await checkAndRequestLocationService();
//     await checkAndRequestLocationPermission();
//     location.changeSettings(
//       distanceFilter: 2,
//     );
//     locationSubscription = location.onLocationChanged.listen(onData);
//   }

//   Future<LocationData> getLocation() async {
//     await checkAndRequestLocationService();
//     await checkAndRequestLocationPermission();
//     return await location.getLocation();
//   }
// }

// class LocationServiceException implements Exception {}

// class LocationPermissionException implements Exception {}
