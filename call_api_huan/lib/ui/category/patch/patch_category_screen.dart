import 'package:call_api_huan/models/category.dart';
import 'package:call_api_huan/ui/category/category_provider.dart';
import 'package:call_api_huan/ui/category/category_screen.dart';
import 'package:call_api_huan/ui/category/patch/patch_category_delegate.dart';
import 'package:call_api_huan/ui/category/patch/patch_category_provider.dart';
import 'package:call_api_huan/ui/category/post/post_category_delegate.dart';
import 'package:call_api_huan/ui/category/post/post_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/base_view.dart';
import '../../../utils/colors.dart';
import '../../../utils/styles.dart';
import '../../../utils/toast.dart';
class PatchCategoryScreen extends StatelessWidget {
  Categoryy categoryy;

  PatchCategoryScreen({required this.categoryy});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PatchCategoryProvider>.value(
      value: PatchCategoryProvider(categoryy: categoryy),
      child:  _BodyWidget(categoryy: categoryy,),
    );
  }
}
class _BodyWidget extends StatefulWidget {
  Categoryy categoryy;


  _BodyWidget({required this.categoryy});

  @override
  _BodyWidgetState createState() => _BodyWidgetState(categoryy: categoryy);
}

class _BodyWidgetState extends State<_BodyWidget> implements PatchCategoryDelegate {

  Categoryy categoryy;

  _BodyWidgetState({required this.categoryy});

  late PatchCategoryProvider _provider;


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _provider = PatchCategoryProvider(categoryy: categoryy);
    _provider.delegate = this as PatchCategoryDelegate;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        appBar: AppBar(
          title: Text("Sửa"),
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
                      _provider.patchCategory();
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryScreen()));
                    },
                    child: Text(
                      "Sửa",
                      style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  child: ElevatedButton(
                    onPressed: () {
                      _provider.deleteCategory();
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryScreen()));
                    },
                    child: Text(
                      "Xoá",
                      style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.white, fontSize: 14),
                    ),
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
