import 'package:intl/intl.dart';
const port = "8080";
const baseUrl = "http://192.168.1.17:$port/";

const appName = "Hello";
//assets
const imageLink = "assets/images/";

//check internet
const String titleDialogInternet = "Kết nối mạng không ổn định";
const String descInternet = "Để sử dụng $appName, bật dữ liệu di động hoặc kết nối với Wi-Fi";
const String Try = "Thử lại";

String formatMoney(int money) {
  var format = NumberFormat.currency(locale: 'vi_VN');
  return format.format(money);
}
