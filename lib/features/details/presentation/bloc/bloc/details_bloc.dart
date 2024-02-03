import 'package:angaadi/features/details/data/service.dart';
import 'package:bloc/bloc.dart';
part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
   on<UpdatepoductEvent>((event, emit) async{
    emit(UpdateLoadingState());
    final response = await EditProduct().updateProduct(event. product, event.id);
     response.fold((l) => emit(UpdateErrorState(l)), (r) => emit(UpdateSuccesState(r)));
   });

   on<EditProductEvent>((event, emit) async{
    emit(EditLoadingState());
     final response =  await EditProduct().editProduct(event.product, event.id);
     response.fold((l) => emit(EditErrorState(l)), (r) => emit(EditSuccessState(r)));

   });

   on<DeleteProductEvent>((event, emit)async {
    emit(DeleteLoadingState());
    final response = await deleteProduct(event.id);
    response.fold((l) => emit(DeleteErrorState(l)), (r) => emit(DeleteSuccessState(r)));

   });
  }
}
