import 'package:equatable/equatable.dart';

import 'model.dart';

class ProductList extends Equatable{

  final List<Product> products;
  ProductList({required this.products});

  @override
  List<Object?> get props => [products];
  Product getById(int id) => Product.getIDContructor(id: id);

  Product getByPosition(int position) => getById(position);
}