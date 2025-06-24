import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<SettingsCubit,SettingsState>(
    listener: (context,state){},
        builder: (context,state){
           var cubit = SettingsCubit.get(context);
      return  Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * AppPadding.p0_06,horizontal: screenWidth * AppPadding.p0_02 ),
          child: Column(
            children: [
              Text(
                AppStrings.settings,
                style: getBoldStyle(color: AppColors.primary,fontSize:screenWidth * AppSize.s0_11),
              ),
              SizedBox(
                height: screenHeight * AppSize.s0_04,
              ),
              Container(
                height: screenHeight* AppSize.s0_005,
                color: AppColors.primary,
              ),
              SizedBox(
                height: screenHeight * AppSize.s0_03,
              ),
              SwitchListTile(
                tileColor: AppColors.bG,
                title: Text(
                  AppStrings.darkMode,
                  style: getBoldStyle(color: AppColors.black,fontSize:screenWidth * AppSize.s0_05),
                ),
                value: cubit.isDarkMode,
                activeColor: AppColors.primary,
                inactiveTrackColor: AppColors.bG,
                onChanged: (_) => cubit.toggleTheme(),
              ),
              SizedBox(
                height: screenHeight * AppSize.s0_03,
              ),
              ListTile(
                tileColor: AppColors.bG,
                title: Text(
                  AppStrings.language,
                  style: getBoldStyle(color: AppColors.black,fontSize:screenWidth * AppSize.s0_05
                  ),),
                trailing: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
                    child: DropdownButton<String>(
                      value: cubit.currentLanguage,
                      dropdownColor: AppColors.bG,
                      underline: SizedBox(),
                      items: const [
                        DropdownMenuItem(value: AppStrings.ar, child: Text(AppStrings.arabic)),
                        DropdownMenuItem(value: AppStrings.en, child: Text(AppStrings.english)),
                      ],
                      onChanged: (value) {
                        if (value != null) cubit.changeLanguage(value);
                      },
                    ),
                  ),
                ),

              ),
              SizedBox(
                height: screenHeight * AppSize.s0_03,
              ),
              ListTile(
                tileColor: AppColors.bG,
                leading: Icon(Icons.logout,color: AppColors.black,),
                title: Text(
                  AppStrings.logOut,
                  style: getBoldStyle(color: AppColors.black,fontSize:screenWidth * AppSize.s0_05),
                ),
                onTap: () {
                     cubit.logout();
                },
              ),
            ],
          ),
        ),
      );
        },
    );
  }
}
