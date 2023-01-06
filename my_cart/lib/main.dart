import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cart/list_product/bloc_bloc.dart';
import 'package:my_cart/models/model.dart';
import 'package:my_cart/ui/product_ui.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            const CatalogAppBar(),
            BlocBuilder<ListProductBloc,ProductState>(
              builder: (context,state){
                if(state is ListProductLoading){
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if(state is ListProductLoaded){
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) => ListProductCatalog(state.productList.getByPosition(index)),
                      childCount: state.productList.products.length,
                    ),
                  );
                }
                else{
                  return const SliverFillRemaining(
                    child: Text('Something went wrong!'),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
class CatalogAppBar extends StatelessWidget {
  const CatalogAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Catalog'),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            print('cart');
          },
        ),
      ],
    );
  }
}

class ListProductCatalog extends StatelessWidget {
  final Product product;
  const ListProductCatalog(this.product,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline6;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            const SizedBox(width: 24),
            Expanded(child: Text(product.name??"", style: textTheme)),
            const SizedBox(width: 24),
            // AddButton(item: item),
          ],
        ),
      ),
    );
  }
}
