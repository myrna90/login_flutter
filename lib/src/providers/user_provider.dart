import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_form_validation/src/user_preferences/user_preferences.dart';

class UserProvider {
  //final _prefs = new UserPreferences();

  Future login(String email, String password) async {
    final url =
        'https://ba1118c.online-server.cloud/ejidoverde/precam/login_conf.php';
    final resp = await http.post(
      url,
      body: {
        'user': email,
        'pword': password + 'w6@W@R',
        'app_log': '1',
        'parents':
            'eXBGRlh6YUdFMHpkaXpTTk51V3J4enpjaVIxRVhFbWRrSks2TSsvWm9RTT0='
      },
    );

    if (resp.statusCode == 200) {
      //print(json.decode(resp.body));
      return json.decode(resp.body);
    } else {
      print(resp.statusCode);
    }
  }

  Future newUser(String email, String password) async {
    final url =
        'https://ba1118c.online-server.cloud/ejidoverde/precam/login_conf.php';
    final resp = await http.post(
      url,
      body: {
        'user': email,
        'word': password,
        //'parents':'eXBGRlh6YUdFMHpkaXpTTk51V3J4enpjaVIxRVhFbWRrSks2TSsvWm9RTT0=',
      },
    );

    if (resp.statusCode == 200) {
      print(json.decode(resp.body));
    } else {
      print(resp.statusCode);
    }
  }
}
