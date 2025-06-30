import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_services_app/core/utils/app_constants.dart';
import 'package:home_services_app/features/location_picker/domain/usecases/map_use_case.dart';
import 'package:permission_handler/permission_handler.dart';
import '../states/map_picker_states.dart';

class MapPickerCubit extends Cubit<MapPickerState> {
  final GetAddressFromLatLngUseCase getAddressFromLatLngUseCase;

  MapPickerCubit(this.getAddressFromLatLngUseCase) : super(MapPickerInitial());

  static MapPickerCubit get(context) => BlocProvider.of(context);

  LatLng _selectedLocation = AppConstants.defaultLocation;

  Future<void> checkPermission() async {
    emit(MapPickerLoading());
    var status = await Permission.location.status;
    if (status.isGranted) {
      emit(MapPickerPermissionGranted());
    } else {
      var result = await Permission.location.request();
      if (result.isGranted) {
        emit(MapPickerPermissionGranted());
      } else {
        emit(MapPickerPermissionDenied());
      }
    }
  }

  void updateLocation(LatLng newLocation) {
    _selectedLocation = newLocation;
    emit(MapLocationPicked());
  }

  Future<void> confirmPickedLocation() async {
    emit(MapPickerLoading());
    try {
      final address = await getAddressFromLatLngUseCase(_selectedLocation);
      emit(MapLocationAddressPicked(address));
    } catch (e) {
      emit(MapPickerError("Error: ${e.toString()}"));
    }
  }
}
