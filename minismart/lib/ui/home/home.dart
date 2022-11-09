import 'package:flutter/material.dart';
import 'package:minismart/ui/allProduct/filter_screen.dart';
import 'package:minismart/ui/home/tabs/cart/cart_screen.dart';
import 'package:minismart/ui/home/tabs/feed/feed_screen.dart';
import 'package:minismart/ui/home/tabs/home/home_screen.dart';
import 'package:minismart/ui/home/tabs/search/search_screen.dart';
import 'package:minismart/ui/home/tabs/user/user_screen.dart';
import 'package:minismart/util/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPosition = 0;
  List<Widget> listBottomWidget = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label:"Trang chủ"),
            BottomNavigationBarItem(
                icon: Icon(Icons.feed_outlined), label: "Tin tức"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Giỏ hàng"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Tài khoản"),
          ],
          currentIndex: selectedPosition,
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryMaterialColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          elevation: 10,

          onTap: (position) {
            setState(() {
              selectedPosition = position;
            });
          },
        ),
      ),
      body: Builder(builder: (context) {
        return listBottomWidget[selectedPosition];
      }),
    );
  }

  void addHomePage() {
    listBottomWidget.add(const HomeScreen());
    listBottomWidget.add(const FeedsScreen());
    listBottomWidget.add(const CartScreen());
    listBottomWidget.add(const UserScreen());
  }
}
// ConvexAppBar(
// style: TabStyle.flip,
// items: const [
// TabItem(icon: Icon(Icons.home,color: Colors.white,), title:"Home"),
// TabItem(
// icon: Icon(Icons.search,color: Colors.white,), title: "Search"),
// TabItem(
// icon: Icon(Icons.shopping_cart,color: Colors.white,), title: "Cart"),
// TabItem(
// icon: Icon(Icons.person,color: Colors.white,), title: "Account"),
// ],
// cornerRadius: 8,
// color: Colors.white,
// initialActiveIndex: selectedPosition,
// backgroundColor: primaryMaterialColor,
// onTap: (position) {
// setState(() {
// selectedPosition = position;
// });
// },
// ),
