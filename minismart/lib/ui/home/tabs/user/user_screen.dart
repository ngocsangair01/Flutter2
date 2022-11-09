import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minismart/components/base_view.dart';
import 'package:minismart/ui/address/address_screen.dart';
import 'package:minismart/ui/home/home.dart';
import 'package:minismart/ui/home/tabs/home/home_screen.dart';
import 'package:minismart/ui/home/tabs/user/user_provider.dart';
import 'package:minismart/ui/login/login_screen.dart';
import 'package:minismart/ui/order/order_screen.dart';
import 'package:minismart/util/colors.dart';
import 'package:minismart/util/secure_storage.dart';
import 'package:minismart/util/styles.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>.value(
        value: UserProvider(),
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
  late UserProvider _provider;


  List<ListProfileSection> listSection = [];


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _provider = Provider.of(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createListItem();
  }

  void createListItem() async {
    bool checkAdmin = await SecureStorage().checkAdmin();
    listSection.add(createSection("Chỉnh sửa địa chỉ nhận hàng", "assets/images/ic_address.png",
        Colors.blue.shade800, const AddressScreen()));
    listSection.add(createSection(
        "Chọn phương thức thanh toán", "assets/images/ic_payment.png", Colors.teal.shade800, Container()));
    listSection.add(createSection(
        "Đơn hàng đã đặt",
        "assets/images/ic_invite_friends.png",
        Colors.indigo.shade800,
        OrderScreen()));
    // listSection.add(createSection("Thông tin về chúng tôi", "assets/images/ic_about_us.png",
    //     Colors.black.withOpacity(0.8), Container()));
    listSection.add(createSection(
        "Đăng xuất", "assets/images/ic_logout.png", Colors.red.withOpacity(0.7), LoginScreen()));

    if(checkAdmin){
      listSection.add(createSection("Quản trị viên", "assets/images/admin.png",
          Colors.black.withOpacity(0.8), Container()));
    }
  }

  createSection(String title, String icon, Color color, Widget widget) {
    return ListProfileSection(title, icon, color, widget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: true,
      body: Builder(builder: (context) {
        return Stack(
          children: <Widget>[
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primaryMaterialColor,
              ),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 20),
                child: Image.asset("assets/images/logo.png",fit: BoxFit.cover,),
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Container(),
                  flex: 20,
                ),
                Expanded(
                  child: Stack(
                    children:<Widget>[
                      Container(
                        width: double.infinity,
                        child: Card(
                          margin:
                          const EdgeInsets.only(top: 50, left: 16, right: 16,bottom: 40),
                          color: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(16))),
                          child:_provider.loading? Center(child: CircularProgressIndicator(),)
                              : Column(
                            mainAxisAlignment: _provider.token == "" ? MainAxisAlignment.center : MainAxisAlignment.start,
                            children:_provider.token == ""
                                ?buildNoneAccount()
                                : <Widget>[
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 8, top: 8, right: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(Icons.settings),
                                      iconSize: 24,
                                      color: Colors.black,
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      color: Colors.black,
                                      iconSize: 24,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));
                                      },
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                _provider.user.name,
                                style: CustomTextStyle.textFormFieldBlack
                                    .copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                _provider.user.email,
                                style: CustomTextStyle.textFormFieldMedium
                                    .copyWith(
                                    color: Colors.grey.shade700,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                height: 2,
                                width: double.infinity,
                                color: Colors.grey.shade200,
                              ),
                              buildListView()
                            ],
                          ),
                        ),
                      ),
                      _provider.loading || _provider.token == ""?Container():Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(6),
                          decoration:  BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              shape: BoxShape.circle,),
                              // image: DecorationImage(
                              //     image: 
                              //     fit: BoxFit.contain)),
                          width: 80,
                          height: 80,
                          child: Image.asset(
                              "assets/images/logo_1.png",fit: BoxFit.contain,),
                        ),
                      ),
                    ],
                  ),
                  flex: 75,
                ),

              ],
            )
          ],
        );
      }),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return createListViewItem(listSection[index]);
      },
      itemCount: listSection.length,
    );
  }

  createListViewItem(ListProfileSection listSection) {
    return Builder(builder: (context) {
      return InkWell(
        splashColor: Colors.teal.shade200,
        onTap: () {
          if (listSection.widget != Container()) {
            if(listSection.widget is LoginScreen){
              SecureStorage().removeAccount();
              SecureStorage().removeToken();
              SecureStorage().removeUser();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
            }
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => listSection.widget));
          }
        },
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 12),
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage(listSection.icon),
                width: 20,
                height: 20,
                color: Colors.grey.shade500,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                listSection.title,
                style: CustomTextStyle.textFormFieldBold
                    .copyWith(color: Colors.grey.shade500),
              ),
              const Spacer(
                flex: 1,
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.grey.shade500,
              )
            ],
          ),
        ),
      );
    });
  }

  List<Widget> buildNoneAccount(){
    return [
      Text("Bạn chưa đăng nhập"),
      ElevatedButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
      }, child: Text("Đăng nhập"))
    ];
  }
}
class ListProfileSection {
  String title;
  String icon;
  Color color;
  Widget widget;

  ListProfileSection(this.title, this.icon, this.color, this.widget);
}


