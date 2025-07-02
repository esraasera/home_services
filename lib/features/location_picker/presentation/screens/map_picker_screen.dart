import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/features/location_picker/data/datasource/map_remote_data_source.dart';
import 'package:home_services_app/features/location_picker/data/repository/map_repository.dart';
import 'package:home_services_app/features/location_picker/domain/usecases/map_use_case.dart';
import 'package:home_services_app/features/location_picker/presentation/controller/cubit/map_picker_cubit.dart';
import 'package:home_services_app/features/location_picker/presentation/controller/states/map_picker_states.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/utils/app_constants.dart';

class MapPickerScreen extends StatelessWidget {
  const MapPickerScreen({super.key});

  static CameraPosition initialCameraPosition = CameraPosition(
    target: AppConstants.defaultLocation,
    zoom: 13.0,
  );

  Future<void> _requestLocationPermission(BuildContext context) async {
    final status = await Permission.location.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("locationPermissionMessage".tr()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => _requestLocationPermission(context));

    return BlocProvider(
      create: (_) => MapPickerCubit(
        GetAddressFromLatLngUseCase(
          MapRepositoryImpl(MapRemoteDataSourceImpl()),
        ),
      ),
      child: BlocConsumer<MapPickerCubit, MapPickerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.white,
                  size: 20.sp,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                "selectLocation".tr(),
                style: getBoldStyle(
                  color: AppColors.white,
                  fontSize: 18.sp,
                ),
              ),
            ),
            body: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: initialCameraPosition,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: true,
                  onMapCreated: (controller) {},
                  onCameraMove: (position) {
                    MapPickerCubit.get(context).updateLocation(position.target);
                  },
                ),
                Center(
                  child: Icon(
                    Icons.location_on,
                    size: 50.sp,
                    color: AppColors.marker,
                  ),
                ),
                Positioned(
                  bottom: 24.h,
                  left: 20.w,
                  right: 20.w,
                  child: SizedBox(
                    height: 48.h,
                    child: state is MapPickerLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
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
                            SnackBar(
                              content: Text("failedAddress".tr()),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: Text(
                        "confirmLocation".tr(),
                        style: getBoldStyle(
                          color: AppColors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
