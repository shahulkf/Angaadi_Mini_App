import 'package:angaadi/core/colors/colors.dart';
import 'package:angaadi/features/home/presentation/ui/home.dart';
import 'package:angaadi/features/login/presentation/ui/login.dart';
import 'package:angaadi/features/splash/presentation/bloc/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().add(StartApp());
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is NavigateToHome) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ));
        }
      },
      child: const Scaffold(
        backgroundColor: kBasecolor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: whiteColor,
              size: 100,
            ),
            Center(
              child: Text(
                'ANGAADI',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
