//
//
//
import 'dart:async';

class Validators {
  //validación del password le decimos que esta entrando un string y cual es la salida igual un string
  //
  final validatorPassword = StreamTransformer<String, String>.fromHandlers(
      //aqui se recibe el string del password y el sink le dice que
      // info sigue fluyendo y que info esta mal y bloquearlo

      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('La contraseña esta incompleta');
    }
  });
}
