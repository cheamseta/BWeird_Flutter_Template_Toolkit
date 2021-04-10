// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$ShoppingItemModelFromJson(Map<String, dynamic> json) {
  return TodoModel()
    ..id = json['id']
    ..title = json['title'].toString()
    ..isSelected = false;
}

Map<String, dynamic> _$ShoppingItemModelToJson(TodoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isSelected': false,
    };
