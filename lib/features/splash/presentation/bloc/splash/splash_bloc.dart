import 'package:angaadi/features/splash/data/splash_services.dart';
import 'package:bloc/bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()){
    on<StartApp>((event, emit) async {
     SplashServices services =SplashServices();
     final response = await services.isUserLogged();
     if(!response){
      emit(NavigateToHome());
     }else{
      emit(NavigateToLogin());
     }
    });
  }
}
