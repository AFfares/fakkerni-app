import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SqlcipherKeyStore {
  SqlcipherKeyStore({FlutterSecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  static const String _storageKey = 'fakkerni_sqlcipher_key_v1';

  final FlutterSecureStorage _secureStorage;

  Future<String> loadOrCreateKey() async {
    final existing = await _secureStorage.read(key: _storageKey);
    if (existing != null && existing.isNotEmpty) {
      return existing;
    }

    final key = _generateKey();
    await _secureStorage.write(key: _storageKey, value: key);
    return key;
  }

  String _generateKey() {
    final random = Random.secure();
    final bytes = List<int>.generate(32, (_) => random.nextInt(256));
    return bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  }
}
