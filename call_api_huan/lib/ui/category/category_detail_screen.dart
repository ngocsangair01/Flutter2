import 'package:call_api_huan/components/base_view.dart';
import 'package:call_api_huan/ui/category/category_screen.dart';
import 'package:call_api_huan/ui/category/patch/delete_category_delegate.dart';
import 'package:call_api_huan/ui/category/patch/delete_category_provider.dart';
import 'package:call_api_huan/utils/toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/category.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Categoryy categoryy;

  const CategoryDetailScreen({Key? key, required this.categoryy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<DeleteCategoryProvider>.value(
      value: DeleteCategoryProvider(categoryy: categoryy),
      child: _BodyWidget(
        categoryy: categoryy,
      ),
    );
  }
}

class _BodyWidget extends StatefulWidget {
  Categoryy categoryy;

  _BodyWidget({required this.categoryy});

  @override
  State<_BodyWidget> createState() => _BodyWidgetState(categoryy: categoryy);
}

class _BodyWidgetState extends State<_BodyWidget>
    implements DeleteCategoryDelegate {
  // VoidCallback? callback;
  Categoryy categoryy;

  _BodyWidgetState({required this.categoryy});

  late DeleteCategoryProvider _provider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('Đây là didchange dependency');
    super.didChangeDependencies();
    _provider = DeleteCategoryProvider(categoryy: categoryy);
    _provider.delegate = this as DeleteCategoryDelegate;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      child: MaterialApp(
        home: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  height: 200,
                  width: double.infinity,
                  // child: Image.network(widget.post.pictures[0],fit: BoxFit.fitWidth,width: double.infinity),
                  child: Text(widget.categoryy.name),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(widget.categoryy.description),
                ),
                ElevatedButton(
                    onPressed: () {
                      // callback!();
                      Navigator.push(
                          context,
                        MaterialPageRoute(builder: (context)=>CategoryScreen())
                      );
                    },
                    child: Text('Xoá')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onError(String message) {
    // TODO: implement onError
    ShowToast(context).showToast(message);
  }

  @override
  void onSuccess(String message) {
    // TODO: implement onSuccess
    ShowToast(context).showToast(message);
  }
}
