part of 'login_bloc.dart';

 class LoginEvent {}

class LoginButtonClickedEvent extends LoginEvent{
 final LoginModel loginModel ;
 LoginButtonClickedEvent({required this.loginModel});

}

