import 'package:flutter/material.dart';
import 'package:minismart/model/order.dart';
import 'package:minismart/ui/order/order_provider.dart';
import 'package:minismart/util/colors.dart';
import 'package:minismart/util/styles.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderProvider>.value(
        value: OrderProvider(),
        child: const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatefulWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> {

  late OrderProvider _provider;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _provider = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đơn hàng đã đặt"),
        centerTitle: true,
      ),
      body:_provider.loading?Center(child: CircularProgressIndicator(),) :ListView.builder(
          itemBuilder: (context, index) {
            return _buildOderItem(_provider.orders[index]);
          },
          itemCount: _provider.orders.length,
      )
    );
  }




  _buildOderItem(Order order){
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 8,
        shape: const RoundedRectangleBorder(borderRadius:  BorderRadius.all(Radius.circular(12))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all( Radius.circular(4)), border: Border.all(color: Colors.grey.shade200)),
          padding: const EdgeInsets.only(left: 12, top: 8, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tên người nhận: ${order.name}",
                    style: CustomTextStyle.textFormFieldSemiBold.copyWith(fontSize: 14),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey.shade300,
                          borderRadius: const BorderRadius.all(Radius.circular(16))),
                      child: Text(
                        order.status,
                        style:
                        CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.indigoAccent.shade200, fontSize: 10),
                      ),
                    ),
                  )
                ],
              ),
              createAddressText("Địa chỉ nhận hàng: ${order.address}, ${order.district}, ${order.city}", 12),
              const SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Số điệnt thoại : ",
                      style: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 12, color: Colors.grey.shade800)),
                  TextSpan(
                      text: order.email,
                      style: CustomTextStyle.textFormFieldBold.copyWith(color: Colors.black, fontSize: 12)),
                ]),
              ),
              const SizedBox(
                height: 6,
              ),
              RichText(
                maxLines: 3,
                text: TextSpan(
                    children: [
                  TextSpan(
                      text: "Sản phẩm đã đặt : ",
                      style: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 12, color: Colors.grey.shade800)),
                  TextSpan(
                      text: createTextProduct(order),
                      style: CustomTextStyle.textFormFieldMedium.copyWith(color: primaryMaterialColor, fontSize: 12)),
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                color: Colors.grey.shade300,
                height: 1,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
  createAddressText(String strAddress, double topMargin) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      child: Text(
        strAddress,
        style: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 12, color: Colors.grey.shade800),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  String createTextProduct(Order order){
    List<String> list = [];
    for(int i = 0; i< order.products.length ; i++){
      list.add("${order.products[i].title} x ${order.quantity[i]}");
    }
    return list.toString();
  }
}

