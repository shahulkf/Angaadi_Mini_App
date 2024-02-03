import 'package:angaadi/core/colors/colors.dart';
import 'package:angaadi/features/cart/presentation/ui/cart.dart';
import 'package:angaadi/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:angaadi/features/home/presentation/ui/productile.dart';
import 'package:angaadi/features/login/presentation/ui/login.dart';
import 'package:angaadi/features/wishlist/presentation/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetProductsEvents());
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(
          icon: const Icon(Icons.menu),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.account_circle_rounded,
                          color: kBasecolor),
                      label: const Text('Profile',
                          style: TextStyle(color: kBasecolor)))),
              PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.info, color: kBasecolor),
                      label: const Text('About',
                          style: TextStyle(color: kBasecolor)))),
              PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.help, color: kBasecolor),
                      label: const Text('Help',
                          style: TextStyle(color: kBasecolor)))),
              PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title:  const Text('Are You Sure Want To Logout ?',style: TextStyle(color: kBasecolor),),
                              actions: [
                                BlocListener<HomeBloc, HomeState>(
                                  listener: (context, state) {
                                   
                                   if(state is LogoutSuccessState){
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false);
                                  }
                                  },
                                  child: TextButton(
                                      onPressed: () {
                                        context.read<HomeBloc>().add(LogoutEvent());
                                      },
                                      child:const Text(
                                        'Yes',
                                        style: TextStyle(color: kBasecolor),
                                      )),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child:const Text(
                                      'No',
                                      style: TextStyle(color: Colors.red),
                                    )),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.logout, color: kBasecolor),
                      label: const Text('Logout',
                          style: TextStyle(color: kBasecolor)))),
            ];
          },
        ),
        centerTitle: true,
        title: const Text(
          'Angaadi',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(onPressed: () {
            
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const CartItems(),));
          }, icon: const Icon(Icons.shopping_cart_outlined)),
          IconButton(
              onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Wishlist(),));

              }, icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => current is HomeLoadingState || current is ProductsLoadedSuccessSate || current is GetProductsErrorState,

        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: kBasecolor,
            ));
          } else if (state is ProductsLoadedSuccessSate) {
            return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductTileWidget(
                    product: product,
                  );
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
