import 'album.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
Future<List<Album>> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final responseData = jsonDecode(response.body) as List;
    return responseData.map((e) =>Album.fromJson(e as Map<String, dynamic>) ).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
