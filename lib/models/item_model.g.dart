// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingItemModel _$ShoppingItemModelFromJson(Map<String, dynamic> json) {
  return ShoppingItemModel()
    ..id = json['id']
    ..qty = double.parse(json['qty'].toString())
    ..price = double.parse(json['price'].toString())
    ..itemName = json['product']['itemName'].toString()
    ..itemCode = json['product']['itemCode'].toString()
    ..isSelected = false;
}

Map<String, dynamic> _$ShoppingItemModelToJson(ShoppingItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'qty': instance.qty,
      'price': instance.price,
      'isSelected': false,
    };
