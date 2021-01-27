import 'package:flutter/material.dart';
import 'package:flutter_form_validation/src/bloc/login_bloc.dart';
export 'package:flutter_form_validation/src/bloc/login_bloc.dart';

//provider puede manejar multiples instancias de bloc, puede manejar todo en un solo lugar
//este será nuestro InheritedWidget personalizado nuestro padre de la app
class Provider extends InheritedWidget {
  //este código nos ayuda a poder guardar los cambios que se encuentran
  //escritos en los imputs, así si se hace un hor reload no se perdera la info que ya se haya escrito
  static Provider _instance;

  factory Provider({Key key, Widget child}) {
    if (_instance == null) {
      _instance = new Provider._internal(
        key: key,
        child: child,
      );
    }
    return _instance;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  //que regrese el estado de loginBloc
  //este context es el árbol de widgets
  //esta función va a buscar en el árbol de widgets exactamente con el mismo tipo y va aretornar la instancia de este bloc
  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}
