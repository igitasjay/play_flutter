import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool isLoggedIn = false;

  void storeItem({String? key, String? value}) async {
    // print('This item is being stored with this key: $key and value: $value');
    await storage.write(key: key!, value: value!);
  }

  Future<dynamic> readItem({String? key}) async {
    // print('This item is read  with this key: $key');
    final value = await storage.read(key: key!);
    return value;
  }

  void deleteItem({String? key}) async {
    // print('This item is deleted  with this key: $key');
    await storage.delete(key: key!);
  }

  void deleteAllItems() async {
    await storage.deleteAll();
  }

  Future<dynamic> hasKey({String? key}) async {
    return await storage.containsKey(key: key!);
  }
}
