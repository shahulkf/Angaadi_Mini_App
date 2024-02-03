import 'dart:convert';

import 'package:angaadi/core/constants/api_constants.dart';
import 'package:angaadi/features/home/model/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class HomeServices{
 Future<Either<String,List<ProductModel>>> getProducts()async{
  
 try {
  final url = Uri.parse(ApiConstants.getProductsEndPoints);
  final response = await http.get(url);
  if(response.statusCode ==200){
    final List<dynamic> jsonResponse = jsonDecode(response.body);
    final products =jsonResponse.map((json) => ProductModel.fromJson(json)).toList();
    return right(products);
  }else{
    return  left('Something Went Wrong');
  }
   
 } catch (e) {
  return left(e.toString());
   
 }

 }


}

