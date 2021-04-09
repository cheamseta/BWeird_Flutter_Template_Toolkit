import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_shopper/controllers/tab_index_controller.dart';
import 'package:personal_shopper/views/home/comment_tab/comment_tab_view.dart';
import 'package:personal_shopper/views/home/order_tab/order_tab_view.dart';

// ignore: must_be_immutable
class HomeBodyWidget extends StatelessWidget {

  List<Widget> bodyList = [
    OrderTabViewWidget(),
    CommentTabViewWidget()
  ];

  final TabIndexController navController = Get.put(TabIndexController());

  HomeBodyWidget({ Key key }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx( () => bodyList.elementAt(navController.selectedBodyIndex));
  }
  
}