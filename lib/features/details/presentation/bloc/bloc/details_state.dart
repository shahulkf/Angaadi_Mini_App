part of 'details_bloc.dart';

class DetailsState {}

final class DetailsInitial extends DetailsState {}

 class UpdateLoadingState extends DetailsState{}

 class UpdateErrorState extends DetailsState{
  final String error;

  UpdateErrorState(this.error);
 }

 class UpdateSuccesState extends DetailsState{
  final String success;
  UpdateSuccesState(this.success);
 }

 class EditLoadingState extends DetailsState{}

 class EditErrorState extends DetailsState{
  
  final  String error;

  EditErrorState(this.error);

 }

 class EditSuccessState extends DetailsState{

  final String success;

  EditSuccessState(this.success);
 }

 class DeleteLoadingState extends DetailsState{}

 class DeleteSuccessState extends DetailsState{
  final String success;

  DeleteSuccessState(this.success);
 }

 class DeleteErrorState extends DetailsState{
  final String error;

  DeleteErrorState(this.error);
 }


