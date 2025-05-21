import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/logger.dart';

class CacheServices {
  CacheServices._internal();
  static final CacheServices instance = CacheServices._internal();

  late final SharedPreferences _prefs;
  late final FlutterSecureStorage _secureStorage;

  /// Initialize all storage backends.
  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      _secureStorage = const FlutterSecureStorage();
    } catch (e, stack) {
      dLog.d('CacheService init failed: $e\n$stack');
    }
  }
  // ===== Secure Storage methods =====

  Future<void> setAuthToken(String token) async {
    try {
      await _secureStorage.write(key: 'auth_token', value: token);
    } catch (e) {
      dLog.d('Error saving auth token: $e');
    }
  }

  Future<String?> getAuthToken() async {
    try {
      return await _secureStorage.read(key: 'auth_token');
    } catch (e) {
      dLog.d('Error reading auth token: $e');
      return null;
    }
  }

  Future<void> setUserPhoneNumber(String phone) async {
    try {
      await _secureStorage.write(key: 'user_phone', value: phone);
    } catch (e) {
      dLog.d('Error saving phone number: $e');
    }
  }

  Future<String?> getUserPhoneNumber() async {
    try {
      return await _secureStorage.read(key: 'user_phone');
    } catch (e) {
      dLog.d('Error reading phone number: $e');
      return null;
    }
  }

  // ===== SharedPreferences methods =====

  Future<void> setUserRole(String role) async {
    try {
      await _prefs.setString('user_role', role);
    } catch (e) {
      dLog.d('Error saving user role: $e');
    }
  }

  String getUserRole() {
    try {
      return _prefs.getString('user_role') ?? 'rider';
    } catch (e) {
      dLog.d('Error getting user role: $e');
      return 'rider';
    }
  }
}
