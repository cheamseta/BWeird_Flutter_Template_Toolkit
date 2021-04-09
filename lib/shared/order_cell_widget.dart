import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_shopper/controllers/item_controller.dart';
import 'package:personal_shopper/models/order_model.dart';
import 'package:personal_shopper/themes/color.dart';
import 'package:personal_shopper/themes/text_style.dart';

// ignore: must_be_immutable
class OrderCellWidget extends StatelessWidget {
  ShoppingItemController shoppingItemController =
      Get.put(ShoppingItemController());

  final OrderModel orderModel;
  final Function(OrderModel) selectedCallBack;

  OrderCellWidget({this.orderModel, this.selectedCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: ColorTheme.COLOR_GREY),
          ),
        ),
        child:  ListTile(
            onTap: () => selectedCallBack(this.orderModel),
            trailing: Icon(Icons.arrow_forward),
            title: Text("វិក័យបត្រ័  #" + this.orderModel.id,
                style: TextSt.textSyleInColorSize(ColorTheme.COLOR_DARK, 18)),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "ដឹកជញ្ចូនពីម៉ោង ៖ " +
                      this.orderModel.deliveryFromHour +
                      " - ដល់ម៉ោង ៖" +
                      this.orderModel.deliveryToHour,
                  style: TextSt.textSyleInColorSize(ColorTheme.COLOR_GREY, 14)),
            ),
          ),
        );
  }
}
