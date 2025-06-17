import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_services_app/features/location_picker/presentation/controller/states/map_picker_states.dart';

class MapPickerCubit extends Cubit<MapPickerState> {
  MapPickerCubit() : super(MapPickerInitial());

  static MapPickerCubit get(context) => BlocProvider.of(context);

  LatLng _selectedLocation = const LatLng(30.0444, 31.2357);
  LatLng get selectedLocation => _selectedLocation;

  void updateLocation(LatLng newLocation) {
    _selectedLocation = newLocation;
    emit(MapLocationPicked(newLocation));
  }

  Future<void> confirmPickedLocation() async {
    emit(MapPickerLoading());
    try {
      final placeMarks = await placemarkFromCoordinates(
        _selectedLocation.latitude,
        _selectedLocation.longitude,
      );
      final place = placeMarks.first;
      final address = "${place.street}, ${place.locality}, ${place.country}";
      emit(MapLocationAddressPicked(_selectedLocation, address));
    } catch (e) {
      emit(MapPickerError("Geocoding error: ${e.toString()}"));
    }
  }
}
