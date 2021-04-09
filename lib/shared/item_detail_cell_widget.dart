import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_shopper/controllers/item_controller.dart';
import 'package:personal_shopper/themes/color.dart';
import 'package:personal_shopper/themes/text_style.dart';

// ignore: must_be_immutable
class ItemDetailCellWidget extends StatelessWidget {
  ShoppingItemController shoppingItemController =
      Get.put(ShoppingItemController());

  final String title;
  final String subtitle;
  final String detailString;

  ItemDetailCellWidget({this.detailString, this.subtitle, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: ColorTheme.COLOR_GREY),
        ),
      ),
      child: ListTile(
        trailing:  Text(this.detailString,
            style: TextSt.textSyleInColorSize(ColorTheme.COLOR_DARK, 18)) ,
        title: Text(this.title,
            style: TextSt.textSyleInColorSize(ColorTheme.COLOR_PRIMARY, 20)),
  
      ),
    );
  }
}
