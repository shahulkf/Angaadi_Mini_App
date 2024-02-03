import 'package:angaadi/core/colors/colors.dart';
import 'package:angaadi/features/details/presentation/ui/details.dart';
import 'package:angaadi/features/home/presentation/ui/productile.dart';
import 'package:angaadi/features/wishlist/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WishlistBloc>().add(GetWishListEvent());
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: kBasecolor,
        title:  const Text('Wishlist'),),
       body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if  (state is WishlistSuccessstate) {
            return ListView.builder(
                itemCount: state.wishlistItems.length,
                itemBuilder: (context, index) {
                  final product = state.wishlistItems[index];
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