import 'package:call_api_huan/ui/category/category_list.dart';
import 'package:call_api_huan/ui/category/patch/delete_category_provider.dart';
import 'package:call_api_huan/ui/category/post/post_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'patch/patch_category_screen.dart';
import 'category_provider.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryProvider>.value(
      value: CategoryProvider(),
      child: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatefulWidget {
  @override
  State<_BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> {
  late CategoryProvider _provider;
  late DeleteCategoryProvider _providerDelete;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _provider = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tin tức"),
        centerTitle: true,
      ),
      body: _provider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  CategoryList(_provider),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PostCategoryScreen(),
                        ),
                      );
                    },
                    child: const Text('Them moi'),
                  ),
                ],
              ),
            ),
    );
  }
}
