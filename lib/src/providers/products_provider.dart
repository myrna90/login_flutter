//
//
//
import 'dart:convert';
import 'package:flutter_form_validation/src/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsProvider {
  final String _url =
      'https://flutter-varios-16593-default-rtdb.firebaseio.com';

  Future<bool> createProduct(ProductModel product) async {
    final url = '$_url/products.json';

    final resp = await http.post(url, body: productModelToJson(product));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<ProductModel>> uploadProducts() async {
    final url = '$_url/products.json';

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return [];
  }
}
