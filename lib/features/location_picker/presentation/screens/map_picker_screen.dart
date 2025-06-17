import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_services_app/core/theme/app_colors.dart';

class MapPickerScreen extends StatelessWidget {
   MapPickerScreen({super.key});
  static const CameraPosition _kGooglePlex = CameraPosition(
    target:  LatLng(30.0444, 31.2357),
    zoom: 13.0,
  );
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: IconButton(
           onPressed: ()
           {
             Navigator.pop(context);
             },
           icon: Icon(
             Icons.arrow_back_ios_new_outlined,
             color: AppColors.white,
           )),
     ),
  body: GoogleMap(
    mapType: MapType.normal,
    initialCameraPosition: _kGooglePlex,
    onMapCreated: (GoogleMapController controller) {
      _controller.complete(controller);
    },
  ),
   );
  }


}