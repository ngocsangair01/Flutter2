import 'package:call_api_huan/ui/category/category_provider.dart';
import 'package:call_api_huan/ui/category/category_screen.dart';
import 'package:call_api_huan/ui/category/post/post_category_delegate.dart';
import 'package:call_api_huan/ui/category/post/post_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/base_view.dart';
import '../../../utils/colors.dart';
import '../../../utils/styles.dart';
import '../../../utils/toast.dart';
class PostCategoryScreen extends StatelessWidget {
  const PostCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostCategoryProvider>.value(
      value: PostCategoryProvider(),
      child: const _BodyWidget(),
    );
  }
}
class _BodyWidget extends StatefulWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> implements PostCategoryDelegate {

  late PostCategoryProvider _provider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _provider = PostCategoryProvider();
    _provider.delegate = this as PostCategoryDelegate;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        appBar: AppBar(
          title: Text("Thêm mới"),
          centerTitle: true,
        ),
        child: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                    controller: _provider.nameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                      border: CustomBorder.enabledBorder,
                      labelText: "Tên",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: primaryMaterialColor,)
                      ),
                      errorBorder: CustomBorder.errorBorder,
                      enabledBorder: CustomBorder.enabledBorder,
                    ),
                    keyboardType: TextInputType.text),
                SizedBox(height: 20),
                TextFormField(
                    controller: _provider.disController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                      border: CustomBorder.enabledBorder,
                      labelText: "Mô tả",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: primaryMaterialColor,)
                      ),
                      errorBorder: CustomBorder.errorBorder,
                      enabledBorder: CustomBorder.enabledBorder,
                    ),
                    keyboardType: TextInputType.text),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  child: ElevatedButton(
                    onPressed: () {
                      _provider.postCategory();
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryScreen()));
                     },
                    child: Text(
                      "Thêm",
                      style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.white, fontSize: 14),
                    ),
                    // color: primaryMaterialColor,
                    // textColor: Colors.white,
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  @override
  void onError(String message) {
    ShowToast(context).showToast(message);

  }

  @override
  void onSuccess(String message) {
    ShowToast(context).showToast(message);
  }
}
