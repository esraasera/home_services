import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapPickerState {}

class MapPickerInitial extends MapPickerState {}

class MapPickerLoading extends MapPickerState {}

class MapLocationPicked extends MapPickerState {
}

class MapLocationAddressPicked extends MapPickerState {
  final String address;
  MapLocationAddressPicked(this.address);
}

class MapPickerError extends MapPickerState {
  final String message;
  MapPickerError(this.message);
}
