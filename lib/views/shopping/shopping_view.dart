import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_shopper/controllers/item_controller.dart';
import 'package:personal_shopper/models/item_model.dart';
import 'package:personal_shopper/shared/appbar_widget.dart';
import 'package:personal_shopper/shared/helper.dart';
import 'package:personal_shopper/shared/shoping_cell_widget.dart';
import 'package:personal_shopper/themes/color.dart';
import 'package:personal_shopper/themes/text_style.dart';
import 'package:personal_shopper/views/detail/item_detail_view.dart';
import 'package:personal_shopper/views/home/qr_scan.dart';

// ignore: must_be_immutable
class ShoppingTabView extends StatelessWidget {

  final String theTitle;

  ShoppingItemController shoppingItemController =
      Get.put(ShoppingItemController());

  ShoppingTabView({this.theTitle});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppbarWidget(title: this.theTitle),
        body: Container(
        child: GetBuilder<ShoppingItemController>(
            builder: (_dx) => ListView(
                  children: lookForItems(context),
                ))));
  }

  List<Widget> lookForItems(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(ShoppingSectionCellWidget(title: "ស្វែងទំនិញសំរាប់ភ្ញៀវកម្មង"));

    for (int i = 0; i < shoppingItemController.item.length; i++) {
      ShoppingItemModel item = shoppingItemController.item[i];
      widgetList.add(ShoppingCellWidget(
          shopingItem: item,
          index: i,
          reportCallback: () => onReport(context),
          moreCallback: () => onViewMore(),
          qrScanCallback: () => this.onScanQRCode(context)));
    }

    widgetList.add(ShoppingSectionCellWidget(title: "ទំនិញយករួច"));

    for (int i = 0; i < shoppingItemController.cart.length; i++) {
      ShoppingItemModel cart = shoppingItemController.cart[i];
      widgetList.add(ShoppingCellWidget(shopingItem: cart, index: i));
    }

    return widgetList;
  }

  void onScanQRCode(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => TicketQRScan(),
      ),
    );
  }

  void onReport(BuildContext context) {
    Helper.onDialog(
        context,
        "ប្រកាសស្តុកជិតអស់",
        Text("ស្តុកនៃទំនិញនេះពិតជាជិតអស់ស្តុកមែន",
            style: TextSt.textSyleInColorSize(ColorTheme.COLOR_DARK, 15)),
        isConfirmCallback: () => onConfirmDialogStock());
  }

  void onConfirmDialogStock() {}

  void onViewMore() {
    Get.to(ItemDetailView());
  }
}
