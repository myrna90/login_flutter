import 'package:http/http.dart' as http;

main() {
  http.read('http://google.com').then((contents) {
    print(contents); // Here we output the contents of google.com.
  });
}
