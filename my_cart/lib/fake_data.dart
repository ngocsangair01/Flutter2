import 'package:my_cart/models/model.dart';
const _delay = Duration(milliseconds: 800);
var list_product = [
  {
    'id': 1,
    'name':'Áo sơ mi nam',
    'description': 'đây là áo sơ mi nam',
    'price': '120000',
    'favorite':'false'
  },
  {
    'id': 2,
    'name':'Áo phông nam',
    'description': 'đây là áo phông nam',
    'price': '130000',
    'favorite':'false'
  },
  {
    'id': 3,
    'name':'Áo sơ mi nữ',
    'description': 'đây là áo sơ mi nữ',
    'price': '140000',
    'favorite':'false'
  },
  {
    'id': 4,
    'name':'Áo phông nữ',
    'description': 'đây là áo phông nữ',
    'price': '150000',
    'favorite':'false'
  },
  {
    'id': 5,
    'name':'Giày nam',
    'description': 'đây là giày nam',
    'price': '160000',
    'favorite':'false'
  },
  {
    'id': 6,
    'name':'Giày nữ',
    'description': 'đây là giày nữ',
    'price': '170000',
    'favorite':'false'
  },
  {
    'id': 8,
    'name':'Áo chống nắng',
    'description': 'đây là áo chống nắng',
    'price': '180000',
    'favorite':'false'
  },
  {
    'id': 9,
    'name':'Áo chống nắng',
    'description': 'đây là áo chống nắng',
    'price': '180000',
    'favorite':'false'
  },
  {
    'id': 10,
    'name':'Áo chống nắng',
    'description': 'đây là áo chống nắng',
    'price': '180000',
    'favorite':'false'
  },
  {
    'id': 11,
    'name':'Áo chống nắng',
    'description': 'đây là áo chống nắng',
    'price': '180000',
    'favorite':'false'
  },
  {
    'id': 12,
    'name':'Áo chống nắng',
    'description': 'đây là áo chống nắng',
    'price': '180000',
    'favorite':'false'
  },
];
class ProductRepository{
  final _products = <Product>[];
  Future<List<Product>> loadListProduct() => Future.delayed(_delay,(){
    var products =  list_product.map((e) => Product.fromJson(e)).toList();
    return products;
  });
  Future<List<Product>> loadCart() => Future.delayed(_delay,() => _products);
  void addProductToCart(Product product) => _products.add(product);
  void removeProductFromCart(Product product) => _products.remove(product);
}