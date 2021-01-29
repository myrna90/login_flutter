//
//
//
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserProvider {
  final String _firebaseToken = 'AIzaSyDYjA1SRtvHGlVtgj0lzPXcuq-rTGXW83I';
//

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
      body: json.encode(authData),
    );
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      //TODO: Salvar el token en el storage

      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['menssage']};
    }
  }

  Future<Map<String, dynamic>> newUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
      body: json.encode(authData),
    );
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    // print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      //TODO: Salvar el token en el storage

      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['menssage']};
    }
  }
}
