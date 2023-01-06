import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_cart/models/model_list.dart';

import '../fake_data.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class ListProductBloc extends Bloc<Event, ProductState> {
  final ProductRepository repository;
  ListProductBloc({required this.repository}) : super(ListProductLoading()) {
    on<Event>(_onStarted);
  }

  FutureOr<void> _onStarted(Event event, Emitter<ProductState> emit) async{
    emit(ListProductLoading());
    try{
      final listProduct = await repository.loadListProduct();
      emit(ListProductLoaded(ProductList(products: listProduct)));
    } catch(_){
      emit(ListProductError());
    }
  }
}
