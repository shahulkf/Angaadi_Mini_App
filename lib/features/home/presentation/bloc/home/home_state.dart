part of 'home_bloc.dart';

class HomeState {}

final class HomeInitial extends HomeState {}
 
 class HomeLoadingState extends HomeState{}

 class ProductsLoadedSuccessSate extends HomeState{

  List<ProductModel>products ;
  ProductsLoadedSuccessSate({required this.products});
 }

 class GetProductsErrorState extends HomeState{}

 class LogoutSuccessState extends HomeState{}

 class WishlistAddedState extends HomeState{}

 class ItemCartedState extends HomeState{}
 
