import 'package:flutter/material.dart';
import 'package:minismart/components/base_view.dart';
import 'package:minismart/ui/allProduct/filter_screen.dart';
import 'package:minismart/ui/home/home.dart';
import 'package:minismart/ui/login/login_delegate.dart';
import 'package:minismart/ui/login/login_provider.dart';
import 'package:minismart/ui/register/register_screen.dart';
import 'package:minismart/util/colors.dart';
import 'package:minismart/util/styles.dart';
import 'package:minismart/util/toast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {

  String? email;
  String? password;

  LoginScreen({Key? key, this.email,this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>.value(
        value: LoginProvider(),
        child: _BodyWidget(email??"",password??""),
    );
  }
}

class _BodyWidget extends StatefulWidget {

  String email;
  String password;


  _BodyWidget(this.email, this.password);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> implements LoginDelegate {

  late LoginProvider _provider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _provider = Provider.of(context);
    _provider.delegate = this;
    _provider.emailController.text = widget.email;
    _provider.passwordController.text = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: AppBar(
        title: Text("Đăng nhập"),
        centerTitle: true,
      ),
        child: Builder(builder: (context) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: <Widget>[
                const Expanded(
                  child: Image(
                      image: AssetImage("assets/images/logo_1.png"),
                      height: 140,
                      alignment: Alignment.center,
                      width: 200),
                  flex: 40,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _provider.emailController,

                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                              // border: CustomBorder.enabledBorder,
                              hintText: "Email",
                              filled: true,
                              hintStyle: const TextStyle(color: primaryMaterialColor),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: primaryMaterialColor,)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: primaryMaterialColor,)
                              ),
                              // errorBorder: CustomBorder.errorBorder,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: primaryMaterialColor,)
                              ),
                              labelStyle: CustomTextStyle.textFormFieldMedium
                                  .copyWith(fontSize: MediaQuery.of(context).textScaleFactor * 16, color: primaryMaterialColor)),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _provider.passwordController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                              // border: CustomBorder.enabledBorder,
                              hintText: "Password",
                              filled: true,
                              hintStyle: const TextStyle(color: primaryMaterialColor),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: primaryMaterialColor,)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: primaryMaterialColor,)
                              ),
                              // errorBorder: CustomBorder.errorBorder,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: primaryMaterialColor,)
                              ),
                              labelStyle: CustomTextStyle.textFormFieldMedium
                                  .copyWith(fontSize: MediaQuery.of(context).textScaleFactor * 16, color: primaryMaterialColor)),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              _provider.login();
                            },
                            child: Text(
                              "Đăng nhập",
                              style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.white, fontSize: 14),
                            ),
                            // color: primaryMaterialColor,
                            // textColor: Colors.white,
                            // shape: const RoundedRectangleBorder(borderRadius: const BorderRadius.all(const Radius.circular(12))),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            child: Text(
                              "Quên mật khẩu",
                              style: CustomTextStyle.textFormFieldBold.copyWith(color: Colors.blue, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                color: Colors.grey.shade200,
                                margin: const EdgeInsets.only(right: 16),
                                height: 1,
                              ),
                              flex: 40,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.grey.shade200,
                                margin: const EdgeInsets.only(left: 16),
                                height: 1,
                              ),
                              flex: 40,
                            )
                          ],
                        ),

                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Bạn chưa có tài khoản?",
                              style: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 14),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              child: Text(
                                "Đăng kí",
                                style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 14, color: primaryMaterialColor),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  flex: 60,
                )
              ],
            ),
          );
        })
    );
  }

  @override
  void showError(String message) {
    ShowToast(context).showToast(message);
  }

  @override
  void showSuccess(String message) {
    ShowToast(context).showToast(message);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }
}

