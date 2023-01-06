import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  RxString message = "Information".obs;

  RxString buttonCheck = "Check".obs;
  Rx<TextEditingController> textController = TextEditingController().obs;

  int validate() {
    RegExp reg = RegExp(r"[0-9]{10}-[0-9]{3}");
    RegExpMatch? match = reg.firstMatch(textController.value.text);
    if(textController.value.text.length ==0){
      message.value="Fill";
      return 1;
    }
    if (match?[0]?.length == 0) {
      return 2;
    } else {
      if (match?[0].toString() == textController.value.text) {
        return 3;
      } else {
        return 2;
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
