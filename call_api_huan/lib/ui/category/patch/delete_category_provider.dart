import 'package:call_api_huan/models/category.dart';
import '../../../components/show_loading.dart';
import 'package:flutter/cupertino.dart';

import '../../../api/api_service.dart';
import 'delete_category_delegate.dart';

class DeleteCategoryProvider extends ChangeNotifier {
  Categoryy categoryy;
  DeleteCategoryProvider({required this.categoryy});

  late DeleteCategoryDelegate _delegate;

  set delegate(DeleteCategoryDelegate value) {
    print('gán _delegate = value');
    _delegate = value;
  }

  void deleteCategory() async {
    await ApiService().getApi().deleteCategory(categoryy.id).then((response) {
      print(categoryy.id);
      ShowLoadingHud().dismissLoadingHud();
      if (response.status == 200) {
        _delegate.onSuccess("Đã xoá");
      } else {
        _delegate.onError(response.message ?? "");
      }
      notifyListeners();
    });
    notifyListeners();
  }
}
