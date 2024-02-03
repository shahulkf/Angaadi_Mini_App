part of 'home_bloc.dart';

class HomeEvent {}
class GetProductsEvents extends HomeEvent{}

class LogoutEvent extends HomeEvent{}

class WishListButtonAddEvent extends HomeEvent{
  ProductModel product;
  WishListButtonAddEvent({required this.product});
}

class CartButtonAddEvent extends HomeEvent{
  ProductModel product;
  CartButtonAddEvent({required this.product});

}




