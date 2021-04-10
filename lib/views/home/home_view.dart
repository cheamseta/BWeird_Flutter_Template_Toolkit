import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bweird_flutter_toolkit/views/home/home_body_widget.dart';
import 'home_bottom_tab_widget.dart';
import '../../shared/components/appbar_widget.dart';
import 'home_drawer_widget.dart';

class HomeScreen extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppbarWidget(title:"To Do Management"),
      body: HomeBodyWidget(),
      bottomNavigationBar: HomeBottomTabWidget(),
    );
  }
}