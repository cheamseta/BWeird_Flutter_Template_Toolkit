import 'dart:convert';
import 'http_client.dart';

class OrderHttpService {
  OrderHttpService._();

  static Future<dynamic> getItemList() async {
    const url = "";
    final userResp = await HttpClient.httpGet(url);
    if (userResp != null) {
      String userObj = userResp.body;
      return json.decode(userObj);
    } else {
      return null;
    }
  }
}
