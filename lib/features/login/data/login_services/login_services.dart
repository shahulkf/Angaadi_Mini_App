import 'dart:convert';

import 'package:angaadi/core/constants/api_constants.dart';
import 'package:angaadi/features/login/models/login_model.dart';
import 'package:angaadi/features/login/models/login_success.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;

class LoginService{
   Future<Either<String,LoginSuccessModel> >userLogin(LoginModel loginModel)async{
    try {
    final response = await http.post(Uri.parse(ApiConstants.loginEndpoints),body: loginModel.toJson());
    if(response.statusCode==200){
      final token = jsonDecode(response.body)['token']as String;
      return right(LoginSuccessModel(token: token));
    }
    return  left('Something went wrong ${response.statusCode}');
    } catch (e) {
      return  left(e.toString());
    }
  }
}