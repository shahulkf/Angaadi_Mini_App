
import 'package:angaadi/core/constants/api_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class EditProduct{

Future <Either<String , String>>updateProduct(Map<String , dynamic>product,int id)async{

final url = "${ApiConstants.getProductsEndPoints}/$id";
 try {
 final response = await http.put(Uri.parse(url),body: product);
 if(response.statusCode == 200){
  return right('Successfully Updated');
 }
 return left('error${response.statusCode}');

   
 } catch (e) {
  return left(e.toString());
   
 }
 

}

Future<Either<String , String>>editProduct(Map<String , dynamic>product , int id)async{
   final url = '${ApiConstants.getProductsEndPoints}/$id';
    try {
     final response = await http.patch(Uri.parse(url),body: product);
     if(response.statusCode == 200){
      return right('Successfully Edited');
     }
     return left('Error');
      
    } catch (e) {
      return left(e.toString());
      
    }

}
}


  Future<Either<String , String>>deleteProduct( int id)async{
    final url = '${ApiConstants.getProductsEndPoints}/$id';
    try {
      final response = await http.delete(Uri.parse(url)); 
      if(response.statusCode == 200){
        return right('Deleted Successfully');
      }
      return left('Error');
    } catch (e) {
      return left(e.toString());
      
    }
  }


