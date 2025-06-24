abstract class StepperState {}

class StepperInitial extends StepperState {}

class StepperChanged extends StepperState {}

class SettingsInitial extends StepperState {}

class SettingsThemeChanged extends StepperState {}

class SettingsLanguageChanged extends StepperState {}

class SettingsUpdated extends StepperState {}

class SettingsLoggedOut extends StepperState {}
