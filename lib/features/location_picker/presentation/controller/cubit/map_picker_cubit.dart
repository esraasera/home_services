import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_services_app/features/location_picker/domain/usecases/map_use_case.dart';
import '../states/map_picker_states.dart';

class MapPickerCubit extends Cubit<MapPickerState> {
  final GetAddressFromLatLngUseCase getAddressFromLatLngUseCase;

  MapPickerCubit(this.getAddressFromLatLngUseCase) : super(MapPickerInitial());

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
      final address = await getAddressFromLatLngUseCase(_selectedLocation);
      emit(MapLocationAddressPicked(_selectedLocation, address));
    } catch (e) {
      emit(MapPickerError("Error: ${e.toString()}"));
    }
  }
}
