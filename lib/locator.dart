import 'package:get_it/get_it.dart';
import 'package:mvvm_firebase/services/authentication_service.dart';
import 'package:mvvm_firebase/services/beers_service.dart';
import 'package:mvvm_firebase/services/dialog_service.dart';
import 'package:mvvm_firebase/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => BeersService());
}
