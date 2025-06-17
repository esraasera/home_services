import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_services_app/features/location_picker/data/datasource/map_remote_data_source.dart';
import 'package:home_services_app/features/location_picker/domain/repository/base_map_repository.dart';

class MapRepositoryImpl implements MapRepository {
  final MapRemoteDataSource remoteDataSource;

  MapRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> getAddressFromLatLng(LatLng latLng) {
    return remoteDataSource.getAddressFromLatLng(latLng);
  }
}
