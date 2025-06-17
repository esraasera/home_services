import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/features/location_picker/presentation/controller/states/map_picker_states.dart';

class MapPickerCubit extends Cubit <MapPickerState> {

  MapPickerCubit() : super(MapPickerInitial());
  static MapPickerCubit get(context) => BlocProvider.of(context);

}