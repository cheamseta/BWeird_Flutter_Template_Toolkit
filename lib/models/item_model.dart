import 'package:json_annotation/json_annotation.dart';
part 'item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShoppingItemModel {

  String id;
  double qty;
  double price;
  String itemCode;
  String itemName;
  bool isSelected;

  ShoppingItemModel();

  factory ShoppingItemModel.fromJson(Map<String, dynamic> json) => _$ShoppingItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShoppingItemModelToJson(this);

}