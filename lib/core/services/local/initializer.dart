import 'package:dio/dio.dart';
import 'package:play/core/services/local/storage_services.dart';

import '../../../constants/constants.dart';
import '../../../locator.dart';

class Initializer {
  StorageService storageService = locator<StorageService>();
  bool isLoggedIn = false;
  bool isOnboarding = false;

  Future initialCalls() async {
    try {
      String? value = await storageService.readItem(key: token);
      if (value != null && value.isNotEmpty) {
        await Future.wait(<Future>[
          // await locator<UserService>().getLocalUser(),
          // getUserCalls(),
        ]);
      }
    } on DioException catch (e) {
      return e.response.toString();
    } catch (e) {
      return e.toString();
    }
  }

  // getUserCalls() async {
  // await locator<UserService>().getLocalUser();
  // }

  init() async {
    await checkForOnboarding();
    await checkForCachedUserData();
  }

  checkForCachedUserData() async {
    String? value = await storageService.readItem(key: token);
    if (value != null && value.isNotEmpty) {
      isLoggedIn = true;
      // await locator<UserService>().getLocalUser();
    } else {
      isLoggedIn = false;
    }
  }

  checkForOnboarding() async {
    String? value = await storageService.readItem(key: isOnboardingCompleted);
    if (value == 'true') {
      isOnboarding = true;
    } else {
      isOnboarding = false;
    }
  }
}
