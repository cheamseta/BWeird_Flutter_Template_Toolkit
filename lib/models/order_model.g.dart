// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel()
    ..id = json['id'] as String
    ..deliveryDate = json['deliveryDate'] as String
    ..deliveryFromHour = json['deliveryFromHour'] as String
    ..deliveryToHour = json['deliveryToHour'] as String
    ..items = json['items'] as Map;
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items' : instance.items,
      'deliveryDate': instance.deliveryDate,
      'deliveryFromHour': instance.deliveryFromHour,
      'deliveryToHour': instance.deliveryToHour,
    };
