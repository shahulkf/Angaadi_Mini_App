import 'package:angaadi/core/colors/colors.dart';
import 'package:angaadi/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:angaadi/features/details/presentation/ui/details.dart';
import 'package:angaadi/features/home/presentation/ui/productile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(GetCartProductsEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBasecolor,
        title:const Text('Cart Items'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if  (state is CartSuccessState) {
            return ListView.builder(
                itemCount: state.cartItems.length,
                itemBuilder: (context, index) {
                  final product = state.cartItems[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(product: product),
                            ));
                      },
                      child: ProductTileWidget(
                        product: product,
                      ));
                });
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
      
    );
  }
}