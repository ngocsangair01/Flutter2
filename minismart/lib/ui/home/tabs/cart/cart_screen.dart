import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minismart/components/base_view.dart';
import 'package:minismart/model/address.dart';
import 'package:minismart/model/product.dart';
import 'package:minismart/ui/address/address_screen.dart';
import 'package:minismart/ui/home/tabs/cart/provider_cart.dart';
import 'package:minismart/ui/login/login_screen.dart';
import 'package:minismart/util/colors.dart';
import 'package:minismart/util/contants.dart';
import 'package:minismart/util/styles.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CartProvider(),
      child: Builder(
        builder: (context) => const _BodyWidget(),
      ),
    );
  }
}

class _BodyWidget extends StatefulWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> {
  late CartProvider provider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    provider = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [createHeader(), createSubTitle()],
        ),
        centerTitle: true,
      ),
      body: provider.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          flex: 80,
          child: createCartList(),
        ),
        footer()
      ],
    );
  }

  createHeader() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Giỏ hàng",
        style: CustomTextStyle.textFormFieldBold
            .copyWith(fontSize: 20, color: Colors.white),
      ),
      // margin: const EdgeInsets.only(left: 12, top: 12),
    );
  }

  createSubTitle() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "${provider.listCart.length} sản phẩm",
        style: CustomTextStyle.textFormFieldBold
            .copyWith(fontSize: 12, color: Colors.white),
      ),
      // margin: const EdgeInsets.only(left: 12, top: 4),
    );
  }

  createCartList() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      primary: false,
      itemBuilder: (context, position) {
        return createCartListItem(provider.listCart[position], position);
      },
      itemCount: provider.listCart.length,
    );
  }

  createCartListItem(Map<String, dynamic> cart, int index) {
    Product product = cart['product'];
    int quantity = int.parse(cart['quantity'].toString());
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 10),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      right: 8, left: 8, top: 8, bottom: 8),
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                    child: Image.network(product.pictures[0]),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(right: 8, top: 4),
                          child: Text(
                            product.title,
                            maxLines: 2,
                            softWrap: true,
                            style: CustomTextStyle.textFormFieldSemiBold
                                .copyWith(fontSize: 14),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          formatMoney(product.price),
                          style: CustomTextStyle.textFormFieldRegular
                              .copyWith(color: Colors.grey, fontSize: 14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              formatMoney(product.price * quantity),
                              style: CustomTextStyle.textFormFieldBlack
                                  .copyWith(color: primaryMaterialColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    splashRadius: 10,
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 16,
                                    ),
                                    color: quantity == 1
                                        ? Colors.grey.shade200
                                        : Colors.grey.shade700,
                                    onPressed: () {
                                      if (quantity > 1) {
                                        setState(() {
                                          quantity--;
                                          cart['quantity'] = "$quantity";
                                        });
                                      }
                                    },
                                  ),
                                  Container(
                                    child: Text(
                                      "$quantity",
                                      style: CustomTextStyle
                                          .textFormFieldSemiBold
                                          .copyWith(
                                              color: primaryMaterialColor),
                                    ),
                                  ),
                                  IconButton(
                                    splashRadius: 10,
                                    icon: const Icon(
                                      Icons.add,
                                      size: 16,
                                    ),
                                    color: Colors.grey.shade700,
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                        cart['quantity'] = "$quantity";
                                      });
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  flex: 100,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => provider.removeCart(index, product.id, context),
              child: Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10, top: 8),
                child: const Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.white,
                ),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: primaryMaterialColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  footer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  "Tổng số tiền: ",
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 30),
                child: Text(
                  formatMoney(provider.calculatorTotalMoney()),
                  style: CustomTextStyle.textFormFieldBlack
                      .copyWith(color: primaryMaterialColor, fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  builder: (context) =>
                      ChangeNotifierProvider<CartBottomSheetProvider>.value(
                        value: CartBottomSheetProvider(),
                        child: _BuildBottomSheet(
                          totalMoney: provider.calculatorTotalMoney(),
                          cartProvider: provider,
                        ),
                      ),
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ));
            },
            // color: primaryMaterialColor,
            // padding: const EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
            // shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Text(
              "Đặt mua",
              style: CustomTextStyle.textFormFieldSemiBold
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
      margin: const EdgeInsets.only(top: 16),
    );
  }
}

class _BuildBottomSheet extends StatefulWidget {
  final int totalMoney;
  final CartProvider cartProvider;

  const _BuildBottomSheet({Key? key, required this.totalMoney,required this.cartProvider})
      : super(key: key);

  @override
  _BuildBottomSheetState createState() => _BuildBottomSheetState();
}

class _BuildBottomSheetState extends State<_BuildBottomSheet> {
  late CartBottomSheetProvider _provider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _provider = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      child: Container(
        padding: const EdgeInsets.only(left: 6, right: 6),
        width: double.infinity,

        child: _provider.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            :_provider.checkIsLogin? SingleChildScrollView(
              child: Column(
                  children: [
                    selectedAddressSection(),
                     priceSection(),
                    ElevatedButton(onPressed: () {_provider.createOrder(widget.cartProvider.listCart, widget.totalMoney, context);}, child: const Text("Đặt hàng"))
                  ],
                ),
            ):Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bạn chưa đăng nhập,vui lòng đăng nhập để đặt mua"),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
              },
                  child: Text("Đăng nhập"))
            ],
          ),
        ) ,
      ),
    );
  }

  selectedAddressSection() {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: InkWell(
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: Colors.grey.shade200)),
            padding: const EdgeInsets.only(left: 12, top: 8, right: 12),
            child: _provider.address == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Bạn chưa có địa chỉ nào."),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const AddressScreen())).then((value){
                                    setState(() {
                                      _provider.getAddress();
                                    });
                              });
                            },
                            child: const Text("Tạo địa chỉ mới"))
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            _provider.address!.name,
                            style: CustomTextStyle.textFormFieldSemiBold
                                .copyWith(fontSize: 14),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 4, bottom: 4),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.grey.shade300,
                                borderRadius:
                                    const BorderRadius.all(const Radius.circular(16))),
                            child: Text(
                              "Mặc định",
                              style: CustomTextStyle.textFormFieldBlack.copyWith(
                                  color: Colors.indigoAccent.shade200,
                                  fontSize: 8),
                            ),
                          )
                        ],
                      ),
                      createAddressText(
                          "${_provider.address!.village}, ${_provider.address!.district}, ${_provider.address!.city}",
                          16),
                      const SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Số điện thoạt/email: ",
                              style: CustomTextStyle.textFormFieldMedium.copyWith(
                                  fontSize: 12, color: Colors.grey.shade800)),
                          TextSpan(
                              text: _provider.address!.phone,
                              style: CustomTextStyle.textFormFieldBold
                                  .copyWith(color: Colors.black, fontSize: 12)),
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
                      addressAction()
                    ],
                  ),
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
        style: CustomTextStyle.textFormFieldMedium
            .copyWith(fontSize: 12, color: Colors.grey.shade800),
      ),
    );
  }

  addressAction() {
    return Container(
      child: Row(
        children: <Widget>[
          const Spacer(
            flex: 2,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Thay đổi",
              style: CustomTextStyle.textFormFieldSemiBold
                  .copyWith(fontSize: 12, color: Colors.indigo.shade700),
            ),
            // splashColor: Colors.transparent,
            // highlightColor: Colors.transparent,
          ),
          const Spacer(
            flex: 3,
          ),
          Container(
            height: 20,
            width: 1,
            color: Colors.grey,
          ),
          const Spacer(
            flex: 3,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Thêm địa chỉ mới",
                style: CustomTextStyle.textFormFieldSemiBold
                    .copyWith(fontSize: 12, color: Colors.indigo.shade700)),
            // splashColor: Colors.transparent,
            // highlightColor: Colors.transparent,
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  priceSection() {
    return Container(

      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 4,
              ),
              Text(
                "Chi tiết",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 8,
              ),
              createPriceItem(
                  "Tổng giá tiền", formatMoney(widget.totalMoney), Colors.grey.shade700),
              createPriceItem("Giảm giá", "0%", Colors.teal.shade300),
              createPriceItem(
                  "Phí vận chuyển", "Miễn phí", Colors.teal.shade300),
              createPriceItem(
                  "Phương thức thanh toán", "Thanh toán khi nhận hàng", Colors.teal.shade300),

              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Tổng",
                    style: CustomTextStyle.textFormFieldSemiBold
                        .copyWith(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    formatMoney(widget.totalMoney),
                    style: CustomTextStyle.textFormFieldMedium
                        .copyWith(color: Colors.black, fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  createPriceItem(String key, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            key,
            style: CustomTextStyle.textFormFieldMedium
                .copyWith(color: Colors.grey.shade700, fontSize: 12),
          ),
          Text(
            value,
            maxLines: 2,
            style: CustomTextStyle.textFormFieldMedium
                .copyWith(color: color, fontSize: 12),
          )
        ],
      ),
    );
  }
}
