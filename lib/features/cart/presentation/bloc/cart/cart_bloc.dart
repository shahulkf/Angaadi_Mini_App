import 'package:angaadi/core/constants/constants.dart';
import 'package:angaadi/features/home/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
   on<GetCartProductsEvent>((event, emit) {
   emit(CartSuccessState(cartItems: cart));

   });
  }
}
