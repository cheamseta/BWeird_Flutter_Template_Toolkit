import 'package:http/http.dart';
import 'dart:convert';
import 'package:personal_shopper/models/user_model.dart';

class HttpClient {
  HttpClient._();

  static const String domain = 'https://app.karotmarkets.com/';
  static const String domainERP = 'https://erp-api.app.karotmarkets.com/v1/';
  static const String username = 'karotBananaAdmin';
  static const String password = 'MXvY82DjzYknRP6L';

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
    print(fullURL);
    return await post(Uri.parse(fullURL), body: body);
  }

  static httpERPPost(String url, Map body) async {
    return await post(Uri.parse(url), headers: header, body: body);
  }

  static httpGet(String url, String filter) async {
    String token = (getToken() != "") ? "?access_token=" + getToken() : "";
    String filterr = (filter != "") ? ("&" + filter) : "";
    String fullURL = domain + url + token + filterr;
    print(fullURL);
    return await get(Uri.parse(fullURL));
  }

  static httpERPGet(String url) async {
    return await get(Uri.parse(url), headers: header);
  }
}
