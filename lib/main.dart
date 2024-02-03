import 'package:angaadi/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:angaadi/features/details/presentation/bloc/bloc/details_bloc.dart';
import 'package:angaadi/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:angaadi/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:angaadi/features/splash/presentation/bloc/splash/splash_bloc.dart';
import 'package:angaadi/features/splash/presentation/ui/splash_screen.dart';
import 'package:angaadi/features/wishlist/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => LoginBloc() ),
        BlocProvider(create:(context) => SplashBloc() ),
        BlocProvider(create:(context) => HomeBloc() ),
        BlocProvider(create:(context) => CartBloc() ),
        BlocProvider(create:(context) => WishlistBloc() ),
        BlocProvider(create: (context) => DetailsBloc(),)
        
      ],

      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(primaryColor: Colors.teal),
          home: const SplashScreen()),
    );
  }
}