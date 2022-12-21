

import 'package:call_api_huan/ui/category/category_detail_screen.dart';
import 'package:call_api_huan/ui/category/category_provider.dart';
import 'package:call_api_huan/ui/category/patch/patch_category_screen.dart';
import 'package:flutter/material.dart';
import '../category/patch/delete_category_provider.dart';
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
        var key = category.id.toString();
        String des = category.description;
        double width = MediaQuery.of(context).size.width;
        print(_provider.categories[index].name);
        return Container(
          child: Column(
            children: [
              Container(
                child: Card(
                  margin: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 10),
                  elevation: 5,
                  child: InkWell(
                    // onTap: (){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> PatchCategoryScreen(categoryy: category)));
                    // },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width/2,
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
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: width/5-40,
                          color: Colors.red,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                              MaterialPageRoute(builder: (context) => CategoryDetailScreen(categoryy: category)));
                            },
                            child: Icon(
                              Icons.ac_unit_outlined,
                            ),
                          ),

                        ),
                      ],
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
