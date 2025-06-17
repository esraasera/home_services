import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapRepository {
  Future<String> getAddressFromLatLng(LatLng latLng);
}
