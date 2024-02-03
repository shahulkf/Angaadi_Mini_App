import 'package:angaadi/core/constants/constants.dart';
import 'package:angaadi/features/home/data/data_source/data_source.dart';
import 'package:angaadi/features/home/model/product_model.dart';
import 'package:angaadi/features/login/data/shared_pref/shared_pref.dart';
import 'package:bloc/bloc.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetProductsEvents>((event, emit)async {
      emit(HomeLoadingState());
      HomeServices homeServices = HomeServices();
     final response = await homeServices.getProducts();
     response.fold((l) => emit(GetProductsErrorState()), (r) => emit(ProductsLoadedSuccessSate(products: r)));

    } );

    on<LogoutEvent>((event, emit) async{
     await SharedPref.deleteToken();
     emit(LogoutSuccessState());

    } );

    on<WishListButtonAddEvent>((event, emit) {
      wishList.add(event.product);
      emit(WishlistAddedState());

    });
    on<CartButtonAddEvent>((event, emit) {
      cart.add(event.product);
      emit(ItemCartedState());
    });
   
  }
}
