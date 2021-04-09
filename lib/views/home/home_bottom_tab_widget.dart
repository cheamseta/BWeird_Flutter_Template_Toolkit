import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_shopper/controllers/tab_index_controller.dart';
import 'package:personal_shopper/themes/color.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeBottomTabWidget extends StatelessWidget {
  final selectedLabel = TextStyle(
    fontFamily: 'Khmer',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 0.30
  );

  final unselectedLabel = TextStyle(
    fontFamily: 'Khmer',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 0.30
  );


  final TabIndexController navController = Get.put(TabIndexController());

  @override
  Widget build(BuildContext context) {


    return Obx( () =>
      BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'ទំនិញភ្ញៀវកម្មង',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank_outlined),
            label: 'បញ្ចេញមតិទូទោ',
          )
        ],
        currentIndex:  navController.selectedBodyIndex,
        unselectedLabelStyle: this.unselectedLabel,
        selectedLabelStyle: this.selectedLabel,
        selectedItemColor: ColorTheme.COLOR_PRIMARY,
        onTap: (index) {
         navController.selectedBodyIndex = index;
        },
      ));
  }
}
