import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_shopper/controllers/item_controller.dart';
import 'package:personal_shopper/controllers/order_controller.dart';
import 'package:personal_shopper/models/order_model.dart';
import 'package:personal_shopper/shared/order_cell_widget.dart';
import 'package:personal_shopper/shared/shoping_cell_widget.dart';
import 'package:personal_shopper/views/shopping/shopping_view.dart';

// ignore: must_be_immutable
class OrderTabViewWidget extends StatelessWidget {
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetBuilder<OrderController>(
            builder: (_dx) => ListView(
                  children: orderListWidget(context),
                )));
  }

  List<Widget> orderListWidget(BuildContext context) {
    List<Widget> widgetList = [];

      widgetList.add(ShoppingSectionCellWidget(title: "បញ្ជីរវិក័យបត្រ័"));

    if (orderController.order.length == 0) {
      widgetList.add(EmptyCellWidget(title:"អត់ទាន់មានការកម្មងទេ"));
    } else {
      for (int i = 0; i < orderController.order.length; i++) {
        OrderModel order = orderController.order[i];
        widgetList.add(OrderCellWidget(
            orderModel: order,
            selectedCallBack: (orderModel) => onSelectOrder(orderModel)));
      }
    }
          return widgetList;
  }

  void onSelectOrder(OrderModel orderModel) {

    ShoppingItemController itemController = Get.put(ShoppingItemController());
    itemController.loadData(orderModel.items);


    Get.to(ShoppingTabView(theTitle: "#" + orderModel.id));
  }
}
