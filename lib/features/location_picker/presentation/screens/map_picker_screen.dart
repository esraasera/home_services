import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/location_picker/data/datasource/map_remote_data_source.dart';
import 'package:home_services_app/features/location_picker/data/repository/map_repository.dart';
import 'package:home_services_app/features/location_picker/domain/usecases/map_use_case.dart';
import 'package:home_services_app/features/location_picker/presentation/controller/cubit/map_picker_cubit.dart';
import 'package:home_services_app/features/location_picker/presentation/controller/states/map_picker_states.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import '../../../../core/utils/app_constants.dart';

class MapPickerScreen extends StatelessWidget {
  const MapPickerScreen({super.key});

  static CameraPosition initialCameraPosition = CameraPosition(
    target: AppConstants.defaultLocation,
    zoom: AppSize.s13,
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_) => MapPickerCubit(
        GetAddressFromLatLngUseCase(
          MapRepositoryImpl(MapRemoteDataSourceImpl()),
        ),
      ),
      child:BlocConsumer<MapPickerCubit,MapPickerState>(
        listener: (BuildContext context,state) {  },
        builder: (BuildContext context,state) {
          return  Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.white,
                  size: screenWidth * AppSize.s0_06,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                  AppStrings.selectLocation,
                  style:getBoldStyle(color: AppColors.white,fontSize: screenWidth * AppSize.s0_045)
              ),
            ),
            body: Stack(
              children: [
                BlocBuilder<MapPickerCubit, MapPickerState>(
                  builder: (context, state) {
                    return GoogleMap(
                      initialCameraPosition: MapPickerScreen.initialCameraPosition,
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
                Center(
                  child: Icon(
                    Icons.location_on,
                    size: screenWidth * AppSize.s0_12,
                    color:AppColors.marker,
                  ),
                ),
                Positioned(
                  bottom: screenHeight * AppSize.s0_03,
                  left: screenWidth * AppSize.s0_05,
                  right:  screenWidth * AppSize.s0_05,
                  child: SizedBox(
                    height: screenHeight * AppSize.s0_065,
                    child:state is MapPickerLoading  ? const Center(child: CircularProgressIndicator()):ElevatedButton(
                      onPressed: () async {
                        final navigator = Navigator.of(context);
                        final messenger = ScaffoldMessenger.of(context);
                        final cubit = MapPickerCubit.get(context);
                        await cubit.confirmPickedLocation();

                        if (cubit.state is MapLocationAddressPicked) {
                          final address =
                              (cubit.state as MapLocationAddressPicked).address;
                          navigator.pop(address);
                        } else {
                          messenger.showSnackBar(
                            const SnackBar(
                              content: Text(AppStrings.failedAddress),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenWidth * AppSize.s0_03),
                        ),
                      ),
                      child: Text(
                          AppStrings.confirmLocation,
                          style:getBoldStyle(color: AppColors.white,fontSize: screenWidth * AppSize.s0_045
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}

