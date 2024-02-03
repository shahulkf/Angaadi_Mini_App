part of 'login_bloc.dart';

class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState{}

class LoginSuccessState extends LoginState{
  
}

class LoginErrorState extends LoginState{
  final String error ;
  LoginErrorState({required this.error});
}
