part of 'details_bloc.dart';

 class DetailsEvent {}

 class UpdatepoductEvent extends DetailsEvent{
  final Map<String , dynamic>product;
  final int id;

  UpdatepoductEvent({required this.product , required this.id});
 }

 class EditProductEvent extends DetailsEvent{
  final Map<String , dynamic>product;
  final int id;

  EditProductEvent(this.product, this.id);
 }

 class DeleteProductEvent extends DetailsEvent{
  final int id;

  DeleteProductEvent(this.id);
 }

