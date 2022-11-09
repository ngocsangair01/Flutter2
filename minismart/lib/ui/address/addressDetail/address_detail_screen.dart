import 'package:flutter/material.dart';
import 'package:minismart/components/base_view.dart';
import 'package:minismart/ui/address/addressDetail/address_detail_provider.dart';
import 'package:minismart/util/colors.dart';
import 'package:minismart/util/styles.dart';
import 'package:provider/provider.dart';

class AddressDetailScreen extends StatelessWidget {
  const AddressDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddressDetailProvider>.value(
        value: AddressDetailProvider(),
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
  late AddressDetailProvider _provider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _provider = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        appBar: AppBar(
          title: Text("Thêm địa chỉ"),
          centerTitle: true,
        ),
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextInput(_provider.nameController, "Tên", TextInputType.text),
              const SizedBox(height: 10,),
              _buildTextInput(_provider.phoneController, "Số điện thoại", TextInputType.number),
              const SizedBox(height: 10,),
              _buildTextInput(_provider.provinceController, "Tỉnh", TextInputType.text),
              const SizedBox(height: 10,),
              _buildTextInput(_provider.districtController, "Huyện", TextInputType.text),
              const SizedBox(height: 10,),
              _buildTextInput(_provider.villageController, "Địa chỉ chi tiết", TextInputType.text),
              const SizedBox(height: 10,),
              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  child: Text("Thêm địa chỉ"),
                  onPressed: (){
                    _provider.updateAddress(context);
                  },
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildTextInput(TextEditingController controller,String label,TextInputType inputType){
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
          border: CustomBorder.enabledBorder,
          labelText: label,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:  const BorderSide(color: primaryMaterialColor,)
          ),
          errorBorder: CustomBorder.errorBorder,
          enabledBorder: CustomBorder.enabledBorder,
        ),
        keyboardType:inputType);
  }
}

