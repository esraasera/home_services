import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationEntity {
  final LatLng latLng;
  final String address;

  LocationEntity({required this.latLng, required this.address});
}
