import 'package:angaadi/features/login/data/shared_pref/shared_pref.dart';

class SplashServices {
  Future<bool> isUserLogged()async{
    await Future.delayed(const Duration(seconds: 3));
    final token = await SharedPref.getToken();
    return token.isEmpty;
  }
}