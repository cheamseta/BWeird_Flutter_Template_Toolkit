import 'package:bweird_flutter_toolkit/views/home/profile_tab/profile_tab_view.dart';
import 'package:bweird_flutter_toolkit/views/home/todo_tab/todo_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bweird_flutter_toolkit/controllers/tab_index_controller.dart';

// ignore: must_be_immutable
class HomeBodyWidget extends StatelessWidget {

  List<Widget> bodyList = [
    TodoTabView(),
    ProfileTabViewWidget()
  ];

  final TabIndexController navController = Get.put(TabIndexController());

  HomeBodyWidget({ Key key }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx( () => bodyList.elementAt(navController.selectedBodyIndex));
  }
  
}