// import 'dart:convert';
//
// import 'package:call_api_huan/api/api_service.dart';
// import 'package:call_api_huan/components/show_loading.dart';
// import 'package:call_api_huan/models/category.dart';
// import 'package:call_api_huan/ui/category/patch/patch_category_delegate.dart';
// import 'package:call_api_huan/ui/category/post/post_category_delegate.dart';
// import 'package:flutter/cupertino.dart';
//
// class PatchCategoryProvider extends ChangeNotifier {
//   Categoryy categoryy;
//
//   PatchCategoryProvider({required this.categoryy});
//
//   late PatchCategoryDelegate _delegate;
//
//   set delegate(PatchCategoryDelegate value) {
//     _delegate = value;
//   }
//
//   var nameController = TextEditingController();
//   var disController = TextEditingController();
//
//   bool validate() {
//     if (nameController.text.length == 0) {
//       _delegate.onError("Not null");
//       return false;
//     }
//     return true;
//   }
//
//   void patchCategory() {
//     if (validate()) {
//       ShowLoadingHud().showLoadingHud();
//       var body = {
//         "name": nameController.text,
//         "description": disController.text,
//       };
//       var jsonBody = json.encode(body);
//       ApiService()
//           .getApi()
//           .editCategory(categoryy.id, jsonBody)
//           .then((response) {
//         ShowLoadingHud().dismissLoadingHud();
//         if (response.status == 200) {
//           _delegate.onSuccess("Done");
//         } else {
//           _delegate.onError(response.message ?? "");
//         }
//       });
//     }
//   }
//
//
// }
