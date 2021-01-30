import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_form_validation/src/user_preferences/user_preferences.dart';

class UserProvider {
  //final _prefs = new UserPreferences();

  Future login(String email, String password) async {
    final authData = {
      'user': email,
      'word': password + 'w6@W@R',
      'parents': 'eXBGRlh6YUdFMHpkaXpTTk51V3J4enpjaVIxRVhFbWRrSks2TSsvWm9RTT0=',
    };

    final body = json.encode(authData);
    final url = 'https://ba1118c.online-server.cloud/ejidoverde/login_conf.php';
    final resp = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: body,
    );

    if (resp.statusCode == 200) {
      print(json.decode(resp.body));
    } else {
      print(resp.statusCode);
    }
  }

  Future newUser(String email, String password) async {
    final authData = {
      'user': email,
      'word': password + 'w6@W@R',
    };

    final body = json.encode(authData);
    final url = 'https://ba1118c.online-server.cloud/ejidoverde/login_conf.php';
    final resp = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: body,
    );

    if (resp.statusCode == 200) {
      print(json.decode(resp.body));
    } else {
      print(resp.statusCode);
    }
  }
}

/*import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_form_validation/src/user_preferences/user_preferences.dart';

class UserProvider {
  final String _firebaseToken =
      'eXBGRlh6YUdFMHpkaXpTTk51V3J4enpjaVIxRVhFbWRrSks2TSsvWm9RTT0=';

  final _prefs = new UserPreferences();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'user': email,
      'word': password + 'w6@W@R',
      'parents': _firebaseToken,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://ba1118c.online-server.cloud/ejidoverde/login_conf.php',
      body: json.encode(authData),
    );
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      // ignore: todo
      //TODO: Salvar el token en el storage
      _prefs.token = decodedResp['idToken'];

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
      'https://ba1118c.online-server.cloud/ejidoverde/login_conf.php',
      body: json.encode(authData),
    );
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    // print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      // ignore: todo
      //TODO: Salvar el token en el storage
      _prefs.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['menssage']};
    }
  }
}
 */
