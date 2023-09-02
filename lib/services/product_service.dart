import 'dart:typed_data';
import '../models/product_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Product> parseListUsuario(Uint8List responseBody) {
  final parsed =
      json.decode(utf8.decode(responseBody)).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

Future<List<Product>> getProducts(int fileNumber) async {
  var url = Uri.http('www.ctsi.com.mx', '/liverpool/product$fileNumber.json');

  final http.Response response = await http.get(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'
  });
  if (response.statusCode == 200) {
    return parseListUsuario(response.bodyBytes);
  } else {
    throw Exception('No pudo consultar la información');
  }
}
