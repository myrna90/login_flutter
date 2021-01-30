//
//
//
import 'dart:convert';
import 'package:flutter_form_validation/src/models/product_model.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductsProvider {
  final String _url =
      'https://flutter-varios-16593-default-rtdb.firebaseio.com';

//crear (post)
  Future<bool> createProduct(ProductModel product) async {
    final url = '$_url/products.json';

    final resp = await http.post(url, body: productModelToJson(product));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

//editar (put) el put remplaza con el mismo id
  Future<bool> editProduct(ProductModel product) async {
    final url = '$_url/products/${product.id}.json';

    final resp = await http.put(url, body: productModelToJson(product));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

//cargar, mostrar, ver o leer (get)
  Future<List<ProductModel>> uploadProducts() async {
    final url = '$_url/products.json';

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductModel> products = new List();
    if (decodedData == null) return [];

    decodedData.forEach(
      (id, product) {
        final productTemp = ProductModel.fromJson(product);

        productTemp.id = id;

        products.add(productTemp);
      },
    );
    print(products);
    return products;
  }

//borrar (delete)
  Future<int> deleteProduct(String id) async {
    final url = '$_url/products/$id.json';
    final resp = await http.delete(url);

    return 1;
  }
}
