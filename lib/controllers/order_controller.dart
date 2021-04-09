import 'package:get/get.dart';
import 'package:personal_shopper/models/order_model.dart';
import 'package:personal_shopper/services/order_http_services.dart';

class OrderController extends GetxController {
  // ignore: deprecated_member_use
  var _order = List<OrderModel>().obs;

  get order => this._order;

  void mOrder(List<OrderModel> order) {
    this._order.value = order;
  }

  void loadJson() async {
    final list = [
      {
        "_id": "0001",
        "orderNumber": "1000",
        "deliveryDate": "10/10/2010",
        "deliveryStartTime": "8:00",
        "deliveryEndTime": "10:00"
      },
      {
        "_id": "0001",
        "orderNumber": "1000",
        "deliveryDate": "10/10/2010",
        "deliveryStartTime": "8:00",
        "deliveryEndTime": "10:00"
      }
    ];

    List<OrderModel> itemList =
        list.map((i) => OrderModel.fromJson(i)).toList();

    mOrder(itemList);
  }

  void retrieveOrdersList() async {
    final orderList = await OrderHttpService.getOrderList();
    List<OrderModel> itemList = [];

   for (Map map in orderList) {
      itemList.add(OrderModel.fromJson(map));
    }
      mOrder(itemList);
      update();
  }

  @override
  void onInit() {
    super.onInit();
    this.retrieveOrdersList();
    // this.loadJson();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory

    super.onClose();
  }
}
