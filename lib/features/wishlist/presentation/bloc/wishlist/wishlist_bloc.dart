import 'package:angaadi/core/constants/constants.dart';
import 'package:angaadi/features/home/model/product_model.dart';
import 'package:bloc/bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
   on<GetWishListEvent>((event, emit) {
    emit(WishlistSuccessstate(wishlistItems: wishList));

   });
  }
}
