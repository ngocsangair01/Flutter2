import 'package:flutter/services.dart';
import 'package:regex_getx/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(Main());
}

class Main extends GetView<FormController> {
  Main() {
    Get.put(FormController());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Regex'),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20),
          child: Container(
            width: 500,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r"[0-9]{10}-[0-9]{3}")),
                    ],
                    // keyboardType: TextInputType.number,
                    // key: const Key('loginForm_emailInput_textField'),
                    onChanged: (text) {
                      print('$text');
                      if(controller.validate()==1){
                        controller.message.value =="Fill";
                      }
                      else if (controller.validate()==3) {
                        controller.message.value = "true";
                      } else {
                        controller.message.value = "false";
                      }
                    },
                    controller: controller.textController.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                        const BorderRadius.all(const Radius.circular(20)),
                      ),
                      labelText: 'Enter a search term',
                      errorText: controller.validate()==2?'False':null,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Obx(
                          () => Text(controller.buttonCheck.toString()),
                    ),
                  ),
                  Container(
                    child: Obx(
                          () => Text(controller.message.toString()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
