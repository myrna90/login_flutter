//
//
//
import 'dart:async';

class Validators {
  //validación del password le decimos que esta entrando un string y cual es la salida igual un string
  //
  final validatorEmail = StreamTransformer<String, String>.fromHandlers(
      //aqui se recibe el string del password y el sink le dice que
      // info sigue fluyendo y que info esta mal y bloquearlo

      handleData: (email, sink) {
    //
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no es correcto');
    }
  });
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
