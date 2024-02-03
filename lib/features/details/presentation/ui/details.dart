import 'package:angaadi/core/colors/colors.dart';
import 'package:angaadi/core/constants/constants.dart';
import 'package:angaadi/features/details/presentation/bloc/bloc/details_bloc.dart';
import 'package:angaadi/features/details/presentation/widgets/textfield.dart';
import 'package:angaadi/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Details extends StatelessWidget {
  final ProductModel product;
  Details({super.key, required this.product});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  detail() {
    titleController.text = product.title;
    priceController.text = product.price;
    descriptionController.text = product.description;
    imageController.text = product.imageUrl;
    categoryController.text = product.category;
  }

  @override
  Widget build(BuildContext context) {
    detail();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
          backgroundColor: kBasecolor,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          Container(
                            height: 400,
                            width: 400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  TextFieldWidget(controller: titleController),
                                  kHeight10,
                                  TextFieldWidget(controller: priceController),
                                  kHeight10,
                                  TextFieldWidget(
                                      controller: descriptionController),
                                  kHeight10,
                                  TextFieldWidget(controller: imageController),
                                  kHeight10,
                                  TextFieldWidget(
                                      controller: categoryController),
                                  kHeight30,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      BlocConsumer<DetailsBloc, DetailsState>(
                                        buildWhen: (previous, current) =>
                                            current is UpdateLoadingState,
                                        listenWhen: (previous, current) =>
                                            current is UpdateErrorState ||
                                            current is UpdateSuccesState,
                                        listener: (context, state) {
                                          print('updtae');
                                          if (state is UpdateErrorState) {
                                            // call snak bar and error should pass
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content:
                                                        Text(state.error)));
                                          } else if (state
                                              is UpdateSuccesState) {
                                            // call snak bar and suces msg should pass
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(state.success),
                                              backgroundColor: kBasecolor,
                                            ));
                                            Navigator.pop(context);
                                          }
                                        },
                                        builder: (context, state) {
                                          return InkWell(
                                            onTap: () {
                                              if (priceController.text.isNotEmpty &&
                                                  titleController
                                                      .text.isNotEmpty &&
                                                  descriptionController
                                                      .text.isNotEmpty &&
                                                  imageController
                                                      .text.isNotEmpty &&
                                                  categoryController
                                                      .text.isNotEmpty) {
                                                // call put event
                                                Map<String, dynamic>
                                                    updatedProduct = {
                                                  'title': titleController.text,
                                                  'price': priceController.text,
                                                  'description':
                                                      descriptionController
                                                          .text,
                                                  'image': imageController.text,
                                                  'category':
                                                      categoryController.text,
                                                };
                                                context.read<DetailsBloc>().add(
                                                    UpdatepoductEvent(
                                                        product: updatedProduct,
                                                        id: product.id));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'Field is Required')));
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 100,
                                              color: kBasecolor,
                                              child: state is UpdateLoadingState
                                                  ? const SizedBox(
                                                      height: 15,
                                                      width: 15,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: whiteColor,
                                                      ))
                                                  : const Text(
                                                      'UPDATE',
                                                      style: TextStyle(
                                                          color: whiteColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                            ),
                                          );
                                        },
                                      ),
                                      BlocConsumer<DetailsBloc, DetailsState>(
                                        listenWhen: (previous, current) =>
                                            current is EditErrorState ||
                                            current is EditSuccessState,
                                        buildWhen: (previous, current) =>
                                            current is EditLoadingState,
                                        listener: (context, state) {
                                          if (state is EditErrorState) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content:
                                                        Text(state.error)));
                                          } else if (state
                                              is EditSuccessState) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(state.success),
                                              backgroundColor: kBasecolor,
                                            ));
                                            Navigator.pop(context);
                                          }

                                          print('edit');
                                        },
                                        builder: (context, state) {
                                          return InkWell(
                                            onTap: () {
                                              if (priceController.text.isNotEmpty &&
                                                  titleController
                                                      .text.isNotEmpty &&
                                                  descriptionController
                                                      .text.isNotEmpty &&
                                                  imageController
                                                      .text.isNotEmpty &&
                                                  categoryController
                                                      .text.isNotEmpty) {
                                                // call patch event
                                                Map<String, dynamic>
                                                    editProduct = {
                                                  'title': titleController.text,
                                                  'price': priceController.text,
                                                  'description':
                                                      descriptionController
                                                          .text,
                                                  'image': imageController.text,
                                                  'category':
                                                      categoryController.text,
                                                };
                                                context.read<DetailsBloc>().add(
                                                    EditProductEvent(
                                                        editProduct,
                                                        product.id));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'Field is Required')));
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 100,
                                              color: kBasecolor,
                                              child: state is EditLoadingState
                                                  ? const SizedBox(
                                                      height: 15,
                                                      width: 15,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: whiteColor,
                                                      ))
                                                  : const Text(
                                                      'EDIT',
                                                      style: TextStyle(
                                                          color: whiteColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.edit_note_outlined,
                  size: 32,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight10,
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    // color: kBasecolor,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        image: DecorationImage(
                            image: NetworkImage(product.imageUrl))),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined))
                ],
              ),
              kHeight30,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24)),
                    kHeight10,
                    Text('\$${product.price}',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700)),
                    kHeight10,
                    Text(product.description,
                        style: const TextStyle(
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
              // const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<DetailsBloc>()
                            .add(DeleteProductEvent(product.id));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 190,
                        color: kBasecolor,
                        child:  BlocConsumer<DetailsBloc, DetailsState>(
                          listener: (context, state) {
                            if(state is DeleteSuccessState){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.success),backgroundColor: kBasecolor,));
                              Navigator.pop(context);
                            }else if (state is DeleteErrorState){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error),backgroundColor: Colors.red,));
                            }
                          
                          },
                          builder: (context, state) {
                            return state is DeleteLoadingState?  const CircularProgressIndicator(color: whiteColor,):const  Text(
                              'REMOVE',
                              style: TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                      ),
                    ),
                    kWidth10,
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 190,
                      color: kBasecolor,
                      child: const Text(
                        'BUY NOW',
                        style: TextStyle(
                            color: whiteColor, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              kHeight10
            ],
          ),
        ));
  }
}
