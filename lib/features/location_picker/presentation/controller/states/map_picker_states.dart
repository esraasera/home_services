import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapPickerState {}
class MapPickerInitial extends MapPickerState {}
class MapLocationPicked extends MapPickerState {
  final LatLng location;
  MapLocationPicked(this.location);
}
