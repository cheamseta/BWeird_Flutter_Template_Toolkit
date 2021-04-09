import 'package:json_annotation/json_annotation.dart';
part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderModel {

  String id;
  String deliveryDate;
  String deliveryFromHour;
  String deliveryToHour;
  Map items;

  OrderModel();

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

}