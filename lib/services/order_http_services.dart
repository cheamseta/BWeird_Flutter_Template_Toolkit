import 'dart:convert';
import 'http_client.dart';

class OrderHttpService {
  OrderHttpService._();

  static Future<dynamic> getOrderList() async {
    const url = "api/orders";
    const filter = "filter=%7B%22fields%22%3A%5B%22id%22%2C%20%22deliveryFromHour%22%2C%20%22deliveryToHour%22%2C%20%22deliveryDate%22%2C%20%22items%22%5D%7D";
    final userResp = await HttpClient.httpGet(url, filter);
    if (userResp != null) {
      String userObj = userResp.body;
      return json.decode(userObj);
    } else {
      return null;
    }
  }
}
