import 'package:flutter/material.dart';
import 'package:personal_shopper/shared/appbar_widget.dart';
import 'package:personal_shopper/shared/item_detail_cell_widget.dart';

class ItemDetailView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(title: "ពត័មាននៃទំនិញ"),
        body: Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                header(),
                ItemDetailCellWidget(title: "តំលៃ", detailString: "10\$"),
                ItemDetailCellWidget(
                    title: "ចំនួនក្នុងស្តុក", detailString: "0"),
                ItemDetailCellWidget(title: "រង្វាស់", detailString: "Unit"),
              ],
            )));
  }

  Widget header() {
    return FadeInImage.assetNetwork(
      placeholder: "assets/images/star2.gif",
      image:
          'https://www.incimages.com/uploaded_files/image/1920x1080/getty_518504426_2000196920009280941_319976.jpg',
    );
  }
}
