import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minismart/model/address.dart';
import 'package:minismart/ui/address/addressDetail/address_detail_screen.dart';
import 'package:minismart/ui/address/address_provider.dart';
import 'package:minismart/util/styles.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddressProvider>.value(
        value: AddressProvider(),
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
  late AddressProvider _provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _provider = Provider.of(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Địa chỉ nhận hàng'),
        centerTitle: true,
      ),
      body: Container(
        padding:const EdgeInsets.all(10),
        child:_provider.loading?Center(child: CircularProgressIndicator(),)
        :_provider.listAddress.isEmpty
            ?Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bạn chưa có địa chỉ nào."),
                  TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddressDetailScreen())).then((value){
                      setState(() {
                        _provider.refresh();
                      });
                    });
                  }, child: Text("Tạo địa chỉ mới"))
                ],
              ),
            )
            :Column(
              children: [
                Expanded(
                  flex: 75,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return addressSection(_provider.listAddress[index]);
                    },
                    itemCount: _provider.listAddress.length,
                    ),
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddressDetailScreen())).then((value){
                        setState(() {
                          _provider.refresh();
                        });
                      });
                    },
                    child: Text("Thêm địa chỉ mới")
                )
              ],
            )
          ),
    );

  }

  addressSection(Address address) {
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
                    address.name,
                    style: CustomTextStyle.textFormFieldSemiBold.copyWith(fontSize: 14),
                  ),
                  InkWell(
                    onTap: (){_provider.deleteAddress(address.id, context);},
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey.shade300,
                          borderRadius: const BorderRadius.all(Radius.circular(16))),
                      child: Text(
                        "Xóa địa chỉ",
                        style:
                        CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.indigoAccent.shade200, fontSize: 8),
                      ),
                    ),
                  )
                ],
              ),
              createAddressText("${address.village}, ${address.district}, ${address.city}", 16),
              const SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Số điệnt thoại : ",
                      style: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 12, color: Colors.grey.shade800)),
                  TextSpan(
                      text: address.phone,
                      style: CustomTextStyle.textFormFieldBold.copyWith(color: Colors.black, fontSize: 12)),
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

}

