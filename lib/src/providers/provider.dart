import 'package:http/http.dart' as http;

class Provider {
  final _url = 'https://oh-prolog.herokuapp.com/';

  getRoutes() async {
    http.get('$_url/consult/routes');
  }
}