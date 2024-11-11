import 'app_preferences.dart';

PreferenceHandler prefHandler = PreferenceHandler._();

class PreferenceHandler with _PrefKeys {
  PreferenceHandler._();

  Future<void> setLoginToken(String companyCode) async {
    await AppPrefrence().setString(_token, companyCode);
  }

  Future<String?> getLoginToken() async {
    return await AppPrefrence().getString(_token);
  }

  //============================================//

  Future<void> setUserId(String userId) async {
    await AppPrefrence().setString(_userId, userId);
  }

  Future<String?> getUserId() async {
    return AppPrefrence().getString(_userId);
  }

  void setLogIn(bool isLogin)async {
    await AppPrefrence().setBoolean(_login, isLogin);
  }
  Future<bool?> getLogIn() async {
    return AppPrefrence().getBoolean(_login);
  }
}

mixin _PrefKeys {

  String get _userId => '_userId';
  String get _login => '_login_';


  String get _token => '_companyCode';

}
