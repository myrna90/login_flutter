import 'package:flutter/material.dart';
import 'package:flutter_form_validation/src/bloc/provider.dart';
import 'package:flutter_form_validation/src/models/product_model.dart';
import 'package:flutter_form_validation/src/providers/products_provider.dart';

import '../models/product_model.dart';

class HomePage extends StatelessWidget {
  final productProvider = new ProductsProvider();
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Home ')),
      body: _createList(),
      floatingActionButton: _createButton(context),
    );
  }

  Widget _createList() {
    return FutureBuilder(
      future: productProvider.uploadProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) => _createItem(context, products[i]),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  //separación del item del listado
  Widget _createItem(BuildContext context, ProductModel product) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        //TODO: borrar producto
        productProvider.deleteProduct(product.id);
      },
      child: ListTile(
        title: Text('${product.title} - ${product.acres}'),
        subtitle: Column(
          children: [
            Text('${product.id}'),
            Text('${product.description}'),
          ],
        ),
        onTap: () =>
            Navigator.pushNamed(context, '/producto', arguments: product),
      ),
    );
  }

  _createButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
        onPressed: () => Navigator.pushNamed(context, '/producto'));
  }
}
