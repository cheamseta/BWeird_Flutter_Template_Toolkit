import 'package:http/http.dart';
import 'dart:convert';
import 'package:bweird_flutter_toolkit/models/user_model.dart';

class HttpClient {
  HttpClient._();

  static const String domain = 'https://jsonplaceholder.typicode.com';
  static const String username = '';
  static const String password = '';

  static String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  static final header = {'authorization': basicAuth};

  static String getToken() {
    UserModel userModel = UserModel.getCurrentUser();
    return userModel.id;
  }

  static httpPost(String url, Map body) async {
    String token = (getToken() != null) ? "?access_token=" + getToken() : "";
    String fullURL = domain + url + token;
    return await post(Uri.parse(fullURL), body: body);
  }

  static httpBasicAuthPost(String url, Map body) async {
    return await post(Uri.parse(url), headers: header, body: body);
  }

  static httpGet(String url, {String filter}) async {
    String token = (getToken() != "") ? "?access_token=" + getToken() : "";
    String filterr = (filter != "") ? ("&" + filter) : "";
    String fullURL = domain + url + token + filterr;
    return await get(Uri.parse(fullURL));
  }

  static httpBasicAuthGet(String url) async {
    return await get(Uri.parse(url), headers: header);
  }
}
