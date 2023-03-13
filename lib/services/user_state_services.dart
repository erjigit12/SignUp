// ignore_for_file: non_constant_identifier_names
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_and_signup/models/user_model.dart';

class UserStateServices {
  static const String _nameKey = 'name-Key';
  static const String _lastnameKey = 'lastName-Key';
  static const String _passwordKey = 'password-Key';
  static const String _registeredKey = 'registered-Key';

  Future<bool> isRegister() async {
    final pref = await SharedPreferences.getInstance();

    return pref.getBool(_registeredKey) ?? false;
  }

  Future<void> SignUp({
    required String name,
    required String lastName,
    required String password,
  }) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString(_nameKey, name);
    await pref.setString(_lastnameKey, lastName);
    await pref.setString(_passwordKey, password);
    await pref.setBool(_registeredKey, true);
  }

  Future<bool> SignIn({
    required String name,
    required String password,
  }) async {
    final pref = await SharedPreferences.getInstance();
    final cashedName = pref.getString(_nameKey);
    final cashedPassword = pref.getString(_passwordKey);

    if (name == cashedName && password == cashedPassword) {
      await pref.setBool(_registeredKey, true);
      return true;
    } else {
      return false;
    }
  }

  Future<UserModel?> GetUser() async {
    final pref = await SharedPreferences.getInstance();

    final cashedName = pref.getString(_nameKey);
    final cashedLastName = pref.getString(_lastnameKey);
    final cashedPassword = pref.getString(_passwordKey);

    if (cashedName != null &&
        cashedLastName != null &&
        cashedPassword != null) {
      return UserModel(
        id: '1',
        name: cashedName,
        lastName: cashedLastName,
        password: cashedPassword,
      );
    }
    return null;
  }

  Future<void> SignOut() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_registeredKey);
  }

  Future<void> Delete() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_nameKey);
    await pref.remove(_lastnameKey);
    await pref.remove(_passwordKey);
  }
}

final services = UserStateServices();
