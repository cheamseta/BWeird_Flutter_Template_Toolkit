import 'package:json_annotation/json_annotation.dart';
part 'todo_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TodoModel {

  String id;
  String title;
  bool isSelected;

  TodoModel();

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$ShoppingItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShoppingItemModelToJson(this);

}