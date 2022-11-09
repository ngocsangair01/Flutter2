import 'package:flutter/material.dart';
import 'package:minismart/components/base_view.dart';
import 'package:minismart/ui/login/login_screen.dart';
import 'package:minismart/ui/register/register_delegate.dart';
import 'package:minismart/ui/register/register_provider.dart';
import 'package:minismart/util/colors.dart';
import 'package:minismart/util/styles.dart';
import 'package:minismart/util/toast.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterProvider>.value(
        value: RegisterProvider(),
        child: const _BodyWidget(),
    );
  }
}
class _BodyWidget extends StatefulWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> implements RegisterDelegate {

  late RegisterProvider _provider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _provider = RegisterProvider();
    _provider.delegate = this;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: AppBar(
        title: Text("Đăng kí"),
        centerTitle: true,
      ),
        child: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image(
                    image: AssetImage("assets/images/logo_1.png"),
                    height: 140,
                    alignment: Alignment.center,
                    width: 200),
                TextFormField(
                  controller: _provider.nameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                        border: CustomBorder.enabledBorder,
                        labelText: "Tên",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: primaryMaterialColor,)
                        ),
                        errorBorder: CustomBorder.errorBorder,
                        enabledBorder: CustomBorder.enabledBorder,
                        ),
                    keyboardType: TextInputType.text),
                SizedBox(height: 20),
                TextFormField(
                    controller: _provider.surnameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                        border: CustomBorder.enabledBorder,
                        labelText: "Họ",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: primaryMaterialColor,)
                        ),
                        errorBorder: CustomBorder.errorBorder,
                        enabledBorder: CustomBorder.enabledBorder,
                        ),
                    keyboardType: TextInputType.text),
                SizedBox(height: 20),
                TextFormField(
                    controller: _provider.emailController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                        // border: CustomBorder.enabledBorder,
                        labelText: "Email",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: primaryMaterialColor,)
                        ),
                        errorBorder: CustomBorder.errorBorder,
                        enabledBorder: CustomBorder.enabledBorder,
                        ),
                    keyboardType: TextInputType.emailAddress),
                SizedBox(height: 20),
                TextFormField(
                    controller: _provider.phoneController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                        // border: CustomBorder.enabledBorder,
                        labelText: "Số điện thoại",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: primaryMaterialColor,)
                        ),
                        errorBorder: CustomBorder.errorBorder,
                        enabledBorder: CustomBorder.enabledBorder,
                        ),
                    keyboardType: TextInputType.number),
                SizedBox(height: 20),
                TextFormField(
                  controller: _provider.passwordController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                      // border: CustomBorder.enabledBorder,
                      labelText: "Mật khẩu",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: primaryMaterialColor,)
                      ),
                      errorBorder: CustomBorder.errorBorder,
                      enabledBorder: CustomBorder.enabledBorder,
                      ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _provider.cfPasswordController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                      border: CustomBorder.enabledBorder,
                      labelText: "Nhập lại mật khẩu",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: primaryMaterialColor,)
                      ),
                      errorBorder: CustomBorder.errorBorder,
                      enabledBorder: CustomBorder.enabledBorder,
                      ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  child: ElevatedButton(
                    onPressed: () {_provider.register();},
                    child: Text(
                      "Đăng kí",
                      style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.white, fontSize: 14),
                    ),
                    // color: primaryMaterialColor,
                    // textColor: Colors.white,
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  @override
  void onError(String message) {
    ShowToast(context).showToast(message);

  }

  @override
  void onSuccess(String message) {
    ShowToast(context).showToast(message);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => LoginScreen(email: _provider.emailController.text, password: _provider.passwordController.text,)));
  }
}
