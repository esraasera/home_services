import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_services_app/features/location_picker/domain/repository/base_map_repository.dart';

class GetAddressFromLatLngUseCase {
  final MapRepository repository;

  GetAddressFromLatLngUseCase(this.repository);

  Future<String> call(LatLng latLng) async {
    return await repository.getAddressFromLatLng(latLng);
  }
}
