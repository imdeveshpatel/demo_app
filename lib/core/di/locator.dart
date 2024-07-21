import 'package:demo_app/view_model/auth/auth_viewmodel.dart';
import 'package:demo_app/view_model/employee/employee_viewmodel.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  /// Inject ViewModels
  /// register as lazy singleton so when we use this model, initialization will happen
  locator.registerLazySingleton(() => AuthViewModel());
  locator.registerLazySingleton(() => EmployeeViewModel());
}
