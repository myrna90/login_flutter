//
import 'package:flutter/material.dart';
import 'package:flutter_form_validation/src/models/product_model.dart';
import 'package:flutter_form_validation/src/providers/products_provider.dart';
import 'package:flutter_form_validation/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();
  final productProvider = new ProductsProvider();

  ProductModel product = new ProductModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        actions: [
          IconButton(
              icon: Icon(Icons.photo_size_select_actual),
              //
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.camera_alt),
              //
              onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          //el form viene siendo un formulario html
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _createName(),
                _createAcres(),
                _createDescription(),
                _createApproved(),
                _submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createName() {
    return TextFormField(
      initialValue: product.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => product.title = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );
  }

  Widget _createAcres() {
    return TextFormField(
      initialValue: product.acres.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: 'Hectareas'),
      onSaved: (value) => product.acres = double.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Solo números';
        }
      },
    );
  }

  Widget _createDescription() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Descripción'),
      onSaved: (value) => product.description = value,
      validator: (value) {
        if (value.length < 30) {
          return 'Ingrese una descripción';
        } else {
          return null;
        }
      },
    );
  }

  Widget _createApproved() {
    return SwitchListTile(
        value: product.approved,
        title: Text('Aprobado'),
        onChanged: (value) => setState(() {
              product.approved = value;
            }));
  }

  Widget _submitButton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.lightGreen,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: _submit,
    );
  }

  void _submit() {
    //condición si el formularios es valido
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    print(product.title);
    print(product.acres);
    print(product.description);
    print(product.approved);

    productProvider.createProduct(product);
  }
}
