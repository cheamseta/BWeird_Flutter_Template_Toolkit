import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_shopper/controllers/item_controller.dart';
import 'package:personal_shopper/models/item_model.dart';
import 'package:personal_shopper/themes/color.dart';
import 'package:personal_shopper/themes/text_style.dart';

// ignore: must_be_immutable
class ShoppingCellWidget extends StatelessWidget {
  ShoppingItemController shoppingItemController =
      Get.put(ShoppingItemController());

  final ShoppingItemModel shopingItem;
  final int index;
  final Function qrScanCallback;
  final Function reportCallback;
  final Function moreCallback;

  ShoppingCellWidget(
      {this.index,
      this.shopingItem,
      this.qrScanCallback,
      this.reportCallback,
      this.moreCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: ColorTheme.COLOR_GREY),
        ),
      ),
      child: Column(
        children: [
          ListTile(
              trailing: Checkbox(
                  value: this.shopingItem.isSelected,
                  onChanged: (value) {
                    if (value == false) {
                      shoppingItemController.addToItem(
                          this.index, this.shopingItem);
                    } else {
                      shoppingItemController.addToCart(
                          this.index, this.shopingItem);
                    }
                  }),
              title: Text(this.shopingItem.itemName,
                  style: TextSt.textSyleInColorSize(ColorTheme.COLOR_DARK, 18)),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Item Code : " + this.shopingItem.id,
                    style:
                        TextSt.textSyleInColorSize(ColorTheme.COLOR_GREY, 14)),
              )),
              Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [

            actionWidget(this.reportCallback, " អស់ស្តុក",Icon(Icons.report_gmailerrorred_outlined, color : ColorTheme.COLOR_PRIMARY)),
            actionWidget(this.qrScanCallback, " ស្កេន",Icon(Icons.qr_code_scanner , color : ColorTheme.COLOR_PRIMARY)),
            actionWidget(this.moreCallback, " បន្ថែម",Icon(Icons.menu_rounded, color: ColorTheme.COLOR_PRIMARY))
          ])
        ],
      ),
    );
  }

  Widget actionWidget(Function callback, String title, Icon icon) {
    return callback != null
        ? TextButton(
            child: Row(children: [icon , Text(title, style: TextSt.textSyleInColorSize(ColorTheme.COLOR_PRIMARY, 18))]), onPressed: callback)
        : SizedBox();
  }
}

class ShoppingSectionCellWidget extends StatelessWidget {
  final String title;
  ShoppingSectionCellWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorTheme.COLOR_PRIMARY,
        padding: EdgeInsets.all(10),
        child: Text(this.title,
            style: TextSt.textSyleInColorSize(ColorTheme.COLOR_LIGHT, 18)));
  }
}

class EmptyCellWidget extends StatelessWidget {
  final String title;
  EmptyCellWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Image.asset("assets/images/star3.gif", width: 200),
          Text(this.title,
              style: TextSt.textSyleInColorSize(ColorTheme.COLOR_PRIMARY, 18))
        ]));
  }
}
