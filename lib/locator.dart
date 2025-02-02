import 'package:get_it/get_it.dart';
import 'package:play/core/services/local/initializer.dart';
import 'package:play/core/services/local/storage_services.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  registerViewModels();
  registerService();
}

void registerService() {
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<Initializer>(() => Initializer());
}

void registerViewModels() {}
