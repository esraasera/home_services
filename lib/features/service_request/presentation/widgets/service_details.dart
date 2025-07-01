import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/app_text_style.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/data/models/service_details_model.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/service_request_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceDetailsModel service;

  const ServiceDetailsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<SettingsCubit,SettingsState>(
      listener: (BuildContext context,  state) {  },
      builder: (BuildContext context, state) {
        var cubit = ServiceRequestCubit.get(context);
        var settingsCubit = SettingsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              leading: InkWell(
                  onTap: () {Navigator.pop(context);},
                  child: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.white,)),
              title: Text(service.subTitle,style: getBoldStyle(color: AppColors.white,fontSize: FontSize.s18),)
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(
              screenWidth * AppPadding.p0_04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Padding(
                  padding: EdgeInsets.all(screenWidth * AppPadding.p0_022,),
                  child: Image.asset(service.imagePath, height: screenHeight * AppSize.s0_25,color: settingsCubit.isDark? AppColors.white :AppColors.black ,),
                )),
                SizedBox(
                  height:screenHeight * AppSize.s0_02,
                ),
                Text(
                  service.description,
                 style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: AppSize.s18
                 )
                ),
                SizedBox(
                  height:screenHeight * AppSize.s0_028,
                ),
                Text("serviceOffered".tr(), style: getBoldStyle(color: settingsCubit.isDark ? AppColors.lightPrimary: AppColors.primary,fontSize: AppSize.s18)),
                SizedBox(
                  height:screenHeight * AppSize.s0_028,
                ),
                ...service.features.map((f) => Text("• $f" ,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: AppSize.s16
                ))),
                SizedBox(
                  height:screenHeight * AppSize.s0_028,
                ),
                Row(
                  children: [
                    Text(" ${"price".tr()} ",style: getBoldStyle(color: settingsCubit.isDark ? AppColors.lightPrimary: AppColors.primary,fontSize: AppSize.s16),),
                    Text(" ${service.price}",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: AppSize.s16
                    )),
                    Text("egp".tr(),style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: AppSize.s16
                    )),
                  ],
                ),
                SizedBox(
                  height:screenHeight * AppSize.s0_02,
                ),
                Row(
                  children: [
                    Text(" ${"duration".tr()}",style: getBoldStyle(color: settingsCubit.isDark ? AppColors.lightPrimary: AppColors.primary,fontSize: AppSize.s16),),
                    Text(" ${service.estimatedDuration}",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: AppSize.s16
                    )),
                  ],
                ),
                SizedBox(
                  height:screenHeight * AppSize.s0_02,
                ),
                Row(
                  children: [
                    Text("${"workingHours".tr()} ",style: getBoldStyle(color: settingsCubit.isDark ? AppColors.lightPrimary: AppColors.primary,fontSize: AppSize.s16),),
                    Text(" ${service.workingHours}",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: AppSize.s16
                    )),
                  ],
                ),
                SizedBox(
                  height:screenHeight * AppSize.s0_06,
                ),
                Center(
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      minimumSize: Size( screenWidth * AppSize.s1 , screenHeight * AppSize.s0_073),
                    ),
                    onPressed: () {
                      cubit.setServiceData(titleKey: service.titleKey, priceKey: service.priceKey);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "bookNow".tr(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
