import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/colors.dart';

class BaseView extends StatefulWidget {

  static bool showLoading = false;
  final Widget child;
  final Widget? appBar;


  const BaseView({Key? key, required this.child, this.appBar}) : super(key: key);

  @override
  BaseViewState createState() => BaseViewState();
}

class BaseViewState extends State<BaseView> {
  static StreamController stream = StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream.stream,
        builder: (context, snapshot) {
          return Scaffold(
            resizeToAvoidBottomInset: false ,
            appBar: PreferredSize(child: widget.appBar??Container(), preferredSize: Size.fromHeight(widget.appBar == null?0:60)),
            body: Stack(
              children: [
                widget.child,
                BaseView.showLoading
                ? Container(
                  alignment: Alignment.center,
                  color: bgLoadingColor,
                  child: LoadingAnimationWidget.inkDrop(
                      color: primaryMaterialColor, size: 50
                  ),
                ):const SizedBox()
              ],
            ),
          );
        });
  }
}
