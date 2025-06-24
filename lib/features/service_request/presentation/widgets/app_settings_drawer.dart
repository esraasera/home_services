import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/utils/app_strings.dart';

class AppSettingsDrawer extends StatelessWidget {
  const AppSettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const DrawerHeader(
            child: Text(
              AppStrings.settings,
              style: TextStyle(fontSize: 24),
            ),
          ),
          SwitchListTile(
            title: const Text(AppStrings.darkMode),
            value: false,
            activeColor: AppColors.primary,
            onChanged: (val) {

            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text(AppStrings.language),
            onTap: () {

            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(AppStrings.logOut),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}
