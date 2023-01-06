part of 'bloc_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ListProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}
class ListProductLoading extends ProductState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ListProductLoaded extends ProductState{
  final ProductList productList;

  ListProductLoaded(this.productList);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ListProductError extends ProductState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}