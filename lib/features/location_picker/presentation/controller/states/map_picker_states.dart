abstract class MapPickerState {}
class MapPickerInitial extends MapPickerState {}
class MapLocationPicked extends MapPickerState {
  final LatLng location;
  MapLocationPicked(this.location);
}
