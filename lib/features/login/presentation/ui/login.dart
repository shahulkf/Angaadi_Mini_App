import 'package:angaadi/core/colors/colors.dart';
import 'package:angaadi/core/constants/constants.dart';
import 'package:angaadi/features/home/presentation/ui/home.dart';
import 'package:angaadi/features/login/models/login_model.dart';
import 'package:angaadi/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController =
      TextEditingController(text: "mor_2314");
  final TextEditingController passwordController =
      TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        kBasecolor,
        Colors.white,
      ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kHeight30,
                  const Text(
                    'Welcome . .',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is Required';
                      }
                      return null;
                    },
                    controller: nameController,
                    style: const TextStyle(color: whiteColor),
                    decoration: InputDecoration(
                        hintText: 'User Name',
                        hintStyle: const TextStyle(color: whiteColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                        fillColor:
                            Theme.of(context).primaryColor.withOpacity(0.7),
                        filled: true),
                  ),
                  kHeight30,
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is Required';
                      }
                      return null;
                    },
                    style: const TextStyle(color: whiteColor),
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: whiteColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                        fillColor:
                            Theme.of(context).primaryColor.withOpacity(0.7),
                        filled: true),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: kBasecolor,
                          backgroundColor: whiteColor,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(15)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final loginModel = LoginModel(
                              userName: nameController.text.trim(),
                              password: passwordController.text.trim());
                          context.read<LoginBloc>().add(
                              LoginButtonClickedEvent(loginModel: loginModel));
                        }
                      },
                      child: BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.error),backgroundColor: Colors.red));
                          }
                          if (state is LoginSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Login successful"),backgroundColor: Colors.green));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                                (route) => false);
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator(
                              color: kBasecolor,
                            ));
                          }
                          return const SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 20, color: kBasecolor),
                              ));
                        },
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
