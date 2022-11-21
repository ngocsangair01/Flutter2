import 'package:call_api_huan/ui/category/category_detail_screen.dart';
import 'package:call_api_huan/ui/category/category_provider.dart';
import 'package:call_api_huan/ui/category/patch/patch_category_screen.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  // const CategoryList({Key? key}) : super(key: key);
  CategoryProvider _provider;

  CategoryList(this._provider);
  ListView _buildListView(){
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _provider.categories.length,
      itemBuilder: (context, index) {
        var category = _provider.categories[index];
        String des = category.description;
        return Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PatchCategoryScreen(categoryy: category)));
                },
                child: Card(
                  margin: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 10),
                  elevation: 5,
                  child: ListTile(
                    // leading: Text('$category.id'),
                    isThreeLine: true,
                    title: Text(category.name),
                    // leading: Image.network(category.description),
                    subtitle: Text(
                      des,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }
}
