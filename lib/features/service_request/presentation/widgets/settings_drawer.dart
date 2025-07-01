import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/routing/app_routes.dart';
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

    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
      if (state is SettingsLoggedOut) {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      }
      },
      builder: (context, state) {
        var cubit = SettingsCubit.get(context);
        return SafeArea(
          child: Drawer(
            child: Column(
              children: [
                Container(
                  height: screenHeight * AppSize.s0_25,
                  width: double.infinity,
                  color: AppColors.primary,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * AppPadding.p0_03,
                    horizontal: screenWidth * AppPadding.p0_03,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Text(
                      AppStrings.settings,
                      style: getBoldStyle(
                        color: AppColors.white,
                        fontSize: screenWidth * AppSize.s0_11,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * AppSize.s0_03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:AppPadding.p8),
                  child: SwitchListTile(
                    title: Text(
                      AppStrings.darkMode,
                      style: getBoldStyle(
                        color: AppColors.black,
                        fontSize: screenWidth * AppSize.s0_05,
                      ),
                    ),
                    value: cubit.isDark,
                    activeColor: AppColors.primary,
                    inactiveTrackColor: AppColors.bG,
                    onChanged: (_) => cubit.toggleTheme(),
                  ),
                ),
                SizedBox(height: screenHeight * AppSize.s0_03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:AppPadding.p8),
                  child: ListTile(
                    title: Text(
                      AppStrings.language,
                      style: getBoldStyle(
                        color: AppColors.black,
                        fontSize: screenWidth * AppSize.s0_05,
                      ),
                    ),
                    trailing: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
                        child: DropdownButton<String>(
                          value: cubit.currentLanguage,
                          dropdownColor: cubit.isDark ? AppColors.lightGrey :AppColors.bG,
                          underline: const SizedBox(),
                          items: [
                            DropdownMenuItem(value: AppStrings.ar, child: Text(AppStrings.arabic,style:TextStyle(
                              color: AppColors.black
                            ))),
                            DropdownMenuItem(value: AppStrings.en, child: Text(AppStrings.english,style:TextStyle(
                                color: AppColors.black
                            )),
                            )],
                          onChanged: (value) {
                            if (value != null) {
                              cubit.changeLanguage(value, context);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * AppSize.s0_03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:AppPadding.p8),
                  child: ListTile(
                    leading: Icon(Icons.logout, color: AppColors.black),
                    title: Text(
                      AppStrings.logOut,
                      style: getBoldStyle(
                        color: AppColors.black,
                        fontSize: screenWidth * AppSize.s0_05,
                      ),
                    ),
                    onTap: () => cubit.logout(),
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
