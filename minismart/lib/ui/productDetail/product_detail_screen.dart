import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:minismart/model/product.dart';
import 'package:minismart/ui/home/tabs/cart/cart_screen.dart';
import 'package:minismart/ui/productDetail/product_provider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:minismart/util/colors.dart';
import 'package:minismart/util/contants.dart';
import 'package:minismart/util/secure_storage.dart';
import 'package:minismart/util/toast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:minismart/util/styles.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductDetailProvider>.value(
        value: ProductDetailProvider(product),
        child: Builder(builder: (context) => const _BodyWidget()));
  }
}

class _BodyWidget extends StatefulWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> {
  late ProductDetailProvider provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of(context);
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
    // provider.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Builder(builder: (context) {
          return SizedBox(
            height: double.infinity,
            child: Stack(
              children: <Widget>[
                _buildProductDetail(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        height: 28,
                        width: 32,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          onPressed: () {
                            provider.quantity = 1;
                            Navigator.pop(context);
                          },
                          iconSize: 14,
                        ),
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 4,
                              width: 4,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                            ),
                            Container(
                              height: 28,
                              width: 32,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                                alignment: Alignment.center,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const CartScreen()));
                                },
                                iconSize: 14,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildProductDetail(){
    return Column(
      children: [
        Expanded(
          flex: 90,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  ImageSlideshow(
                      width: double.infinity,
                      height: 300,
                      initialPage: 0,
                      children: provider.product.pictures.map((e) => Image.network(e,fit: BoxFit.cover,)).toList()
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topLeft,
                        child: Text(
                            provider.product.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                          ),
                        )
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "${formatMoney(provider.product.price)}/${provider.product.unit}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            color: primaryMaterialColor
                          ),
                        )
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: HtmlWidget(
                      provider.product.description
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0))),
                    elevation: MaterialStateProperty.all<double>(8)),
                child: const Text("Thêm vào giỏ hàng"),
                onPressed: () => showBottomSheet(context),
              ),
            ),
          ),
        )
      ],
    );
  }

  void showBottomSheet(BuildContext context) {
    // _scaffoldKey.currentState?.showBottomSheet(
    //       (context) {
    //     return _buildBottomSheet();
    //   },
    //   shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16))),
    // );ư
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) => BuildBottomSheet(provider: provider,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
    );
  }


}

class BuildBottomSheet extends StatefulWidget {
  // final Product product;
  // late int quantity;
  final ProductDetailProvider provider;

  const BuildBottomSheet({Key? key,required this.provider}) : super(key: key);



  @override
  _BuildBottomSheetState createState() => _BuildBottomSheetState();
}

class _BuildBottomSheetState extends State<BuildBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return _buildBottomSheet();
  }

  Widget _buildBottomSheet(){
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(left: Radius.circular(16),right: Radius.circular(16)),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        width: double.infinity,
        height: 200,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Text(
                     widget.provider.product.title,
                    style: CustomTextStyle.textFormFieldSemiBold.copyWith(color: Colors.black87,fontSize: 20),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    splashRadius: 24,
                    icon:const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            _buildRowBottomSheet("Giá tiền", formatMoney(widget.provider.product.price)),
            // SizedBox(height: 8,),
            _buildQuantityRowBottomSheet(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Tổng số tiền:",
                    style: CustomTextStyle.textFormFieldMedium.copyWith( fontSize: 14),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Text(
                    formatMoney(widget.provider.product.price * widget.provider.quantity),
                    style: CustomTextStyle.textFormFieldBlack.copyWith(color: primaryMaterialColor, fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.provider.addToCart(context, widget.provider.product, widget.provider.quantity);
              },
              // color: primaryMaterialColor,
              // padding: const EdgeInsets.only(top: 12, left: 40, right: 40, bottom: 12),
              // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Text(
                "Thêm vào giỏ hàng",
                style: CustomTextStyle.textFormFieldSemiBold.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRowBottomSheet(String title, String value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 8),
          child: Text(
            title,
            style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.black87, fontSize: 14),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: Text(
            value,
            style: const TextStyle(color: primaryMaterialColor, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityRowBottomSheet(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 8),
          child: Text(
            "Số lượng",
            style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.black87, fontSize: 14),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            IconButton(
              splashRadius: 10,
              icon: const Icon(Icons.remove,size: 16,),
              color: widget.provider.quantity == 1?Colors.grey.shade200 :Colors.grey.shade700,
              onPressed: (){
                if(widget.provider.quantity > 1){
                  setState(() {
                    widget.provider.decreaseQuantity();
                  });
                }
              },
            ),
            Container(
              child: Text(
                "${widget.provider.quantity}",
                style: CustomTextStyle.textFormFieldSemiBold.copyWith(color: primaryMaterialColor),
              ),
            ),
            IconButton(
              splashRadius: 10,
              icon: const Icon(Icons.add,size: 16,),
              color: Colors.grey.shade700,
              onPressed: (){
                setState(() {
                  widget.provider.increaseQuantity();
                });
              },
            ),
          ],
        )
      ],
    );
  }
}

