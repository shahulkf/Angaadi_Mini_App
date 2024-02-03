import 'package:angaadi/core/colors/colors.dart';
import 'package:angaadi/core/constants/constants.dart';
import 'package:angaadi/features/details/presentation/ui/details.dart';
import 'package:angaadi/features/home/model/product_model.dart';
import 'package:angaadi/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductModel product;
  const ProductTileWidget({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ItemCartedState) {
          ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text(' Item Added to Cart Successfully'),backgroundColor: kBasecolor,));
        } else if (state is WishlistAddedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(
                 const SnackBar(content: Text('Item Added to Wishlist'),backgroundColor: kBasecolor,));
                 

        }
      },
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(product: product),
              ));
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(product.imageUrl))),
              ),
              kHeight10,
              Text(
                product.title,
                style:const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              kHeight10,
              //  Text(
              //     product.description,
              //     style: TextStyle(fontSize: 18),  
              //   ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context
                                .read<HomeBloc>()
                                .add(WishListButtonAddEvent(product: product));
                          },
                          icon: const Icon(Icons.favorite_border)),
                      IconButton(
                          onPressed: () {
                            context
                                .read<HomeBloc>()
                                .add(CartButtonAddEvent(product: product));
                          },
                          icon: const Icon(Icons.shopping_cart_outlined)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
