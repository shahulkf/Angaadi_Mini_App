part of 'wishlist_bloc.dart';

class WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistSuccessstate extends WishlistState{

  final List<ProductModel> wishlistItems;
  WishlistSuccessstate({required this.wishlistItems});
}
