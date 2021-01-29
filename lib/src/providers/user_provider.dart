import 'package:http/http.dart' as http;

class UserProvider {
  final String _firebaseToken = 'AIzaSyDYjA1SRtvHGlVtgj0lzPXcuq-rTGXW83I';

  Future newUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
    );
  }
}
