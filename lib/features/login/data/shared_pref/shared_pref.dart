import 'package:angaadi/features/login/models/login_success.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

 static Future<String> getToken()async{
  SharedPreferences sharedpreference =await SharedPreferences.getInstance(); 
  return sharedpreference.getString('token')??'';
  
}
static Future<void>  setToken(LoginSuccessModel loginSuccessModel)async{
SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
await sharedPreferences.setString('token',loginSuccessModel.token);
}
static Future<void> deleteToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
 await sharedPreferences.clear();
}

}