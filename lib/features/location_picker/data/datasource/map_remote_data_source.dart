import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapRemoteDataSource {
  Future<String> getAddressFromLatLng(LatLng latLng);
}

class MapRemoteDataSourceImpl implements MapRemoteDataSource {
  @override
  Future<String> getAddressFromLatLng(LatLng latLng) async {
    final placeMarks = await placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );
    final place = placeMarks.first;
    return "${place.street}, ${place.locality}, ${place.country}";
  }
}
