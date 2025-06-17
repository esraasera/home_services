import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/features/location_picker/presentation/controller/cubit/map_picker_cubit.dart';
import 'package:home_services_app/features/location_picker/presentation/controller/states/map_picker_states.dart';

class MapPickerScreen extends StatelessWidget {
  const MapPickerScreen({super.key});

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 13,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapPickerCubit(),
      child: const MapPickerView(),
    );
  }
}

class MapPickerView extends StatelessWidget {
  const MapPickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Select Your Location"),
      ),
      body: Stack(
        children: [
          BlocBuilder<MapPickerCubit, MapPickerState>(
            builder: (context, state) {
              return GoogleMap(
                initialCameraPosition:
                MapPickerScreen._initialCameraPosition,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: true,
                onMapCreated: (_) {},
                onCameraMove: (position) {
                  MapPickerCubit.get(context).updateLocation(position.target);
                },
              );
            },
          ),
          const Center(
            child: Icon(Icons.location_on, size: 40, color: Colors.red),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child:ElevatedButton(
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  final messenger = ScaffoldMessenger.of(context);
                  final cubit = MapPickerCubit.get(context);

                  await cubit.confirmPickedLocation();

                  if (cubit.state is MapLocationAddressPicked) {
                    final address = (cubit.state as MapLocationAddressPicked).address;
                    navigator.pop(address);
                  } else {
                    messenger.showSnackBar(
                      const SnackBar(content: Text("Failed to retrieve the address. Please try again.")),
                    );
                  }
                },
              child: const Text("Confirm Location"),
            ),
          ),
        ],
      ),
    );
  }
}
