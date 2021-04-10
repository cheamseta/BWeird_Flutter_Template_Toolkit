import 'package:bweird_flutter_toolkit/controllers/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bweird_flutter_toolkit/models/todo_model.dart';
import 'package:bweird_flutter_toolkit/themes/color.dart';
import 'package:bweird_flutter_toolkit/themes/text_style.dart';

// ignore: must_be_immutable
class TodoCellWidget extends StatelessWidget {
  TodoController todoController = Get.put(TodoController());

  final TodoModel todoModel;
  final int index;

  TodoCellWidget({this.index, this.todoModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: ColorTheme.COLOR_GREY),
        ),
      ),
      child: 
          ListTile(
              trailing: Checkbox(
                  value: this.todoModel.isSelected,
                  onChanged: (value) {
                    if (value == false) {
                      todoController.addToTodo(
                          this.index, this.todoModel);
                    } else {
                      todoController.addToDone(
                          this.index, this.todoModel);
                    }
                  }),
              title: Text(this.todoModel.title,
                  style: TextSt.textSyleInColorSize(ColorTheme.COLOR_DARK, 18))
    ));
  }

  Widget actionWidget(Function callback, String title, Icon icon) {
    return callback != null
        ? TextButton(
            child: Row(children: [icon , Text(title, style: TextSt.textSyleInColorSize(ColorTheme.COLOR_PRIMARY, 18))]), onPressed: callback)
        : SizedBox();
  }
}

class ShoppingSectionCellWidget extends StatelessWidget {
  final String title;
  ShoppingSectionCellWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorTheme.COLOR_PRIMARY,
        padding: EdgeInsets.all(10),
        child: Text(this.title,
            style: TextSt.textSyleInColorSize(ColorTheme.COLOR_LIGHT, 18)));
  }
}

