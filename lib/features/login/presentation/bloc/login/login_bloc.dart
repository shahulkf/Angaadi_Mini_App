import 'package:angaadi/features/login/data/login_services/login_services.dart';
import 'package:angaadi/features/login/data/shared_pref/shared_pref.dart';
import 'package:angaadi/features/login/models/login_model.dart';
import 'package:bloc/bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {

    on<LoginButtonClickedEvent>((event, emit) async{
      emit(LoginLoadingState());
      LoginService loginService = LoginService();
      final response = await loginService.userLogin(event.loginModel);
      response.fold((error) {
        emit(LoginErrorState(error: error));
      }, (success) {
        SharedPref.setToken(success);
        emit(LoginSuccessState());
      });
    });
  }
}
