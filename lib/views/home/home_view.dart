import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_shopper/views/home/home_body_widget.dart';
import 'home_bottom_tab_widget.dart';
import '../../shared/appbar_widget.dart';
import 'home_drawer_widget.dart';

class HomeScreen extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppbarWidget(title:"ការ៉ុត"),
      body: HomeBodyWidget(),
      bottomNavigationBar: HomeBottomTabWidget(),
    );
  }
}