import 'package:get/get.dart';
import 'package:personal_shopper/models/item_model.dart';

class ShoppingItemController extends GetxController {
  // ignore: deprecated_member_use
  var _item = List<ShoppingItemModel>().obs;

// ignore: deprecated_member_use
  var _cart = List<ShoppingItemModel>().obs;

  get item => this._item;
  get cart => this._cart;

  void mItem(List<ShoppingItemModel> item) {
    this._item.value = item;
  }

  void addToCart(int itemIndex, ShoppingItemModel value) {
    this._item.removeAt(itemIndex);
    value.isSelected = true;
    this._cart.add(value);
    refresh();
  }

  void addToItem(int itemIndex, ShoppingItemModel value) {
    this._cart.removeAt(itemIndex);
    value.isSelected = false;
    this._item.add(value);
    refresh();
  }

  void loadData(Map list) async {

    List<ShoppingItemModel> itemList = [];

    list.forEach((key, value) {
      itemList.add(ShoppingItemModel.fromJson(value));
    });
  
    mItem(itemList);
  }

  void mItemByindex(bool isCheck, ShoppingItemModel value) {
    this._item.add(value);
    refresh();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory

    super.onClose();
  }
}
