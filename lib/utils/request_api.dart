
import 'package:http/http.dart' as http;

class Request{
  final String apiurl;
  final dynamic body;

  Request({this.apiurl, this.body});

  Future<http.Response> post() {
    return http.post(Uri.parse(apiurl), body: body).timeout(Duration(minutes: 2));
  }
  Future<http.Response> get() {
    return http.get(Uri.parse(apiurl)).timeout(Duration(minutes: 2));
  }
}