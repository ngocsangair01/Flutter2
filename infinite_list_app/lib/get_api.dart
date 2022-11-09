import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/images.dart';

Future<List<Imagea>> fetchImage({int? start = 0, int? limit = 100}) async {
  final url =
      "https://jsonplaceholder.typicode.com/photos?_start=$start&_limit=$limit";
  final response = await http.get(Uri.parse(url));
  try {
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body) as List;
      final List<Imagea> imageas = responseData
          .map((imagea) => Imagea.fromJson(imagea as Map<String, dynamic>))
          .toList();
      return imageas;
    } else {
      return <Imagea>[];
    }
  } catch (exception) {
    print('Has error');
    return <Imagea>[];
  }
}
