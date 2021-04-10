import 'package:bweird_flutter_toolkit/models/todo_model.dart';
import 'package:bweird_flutter_toolkit/shared/cell/empty_cell_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bweird_flutter_toolkit/controllers/todo_controller.dart';
import 'package:bweird_flutter_toolkit/shared/cell/todo_cell_widget.dart';

// ignore: must_be_immutable
class TodoTabView extends StatelessWidget {
  final String theTitle;

  TodoController todoController = Get.put(TodoController());

  TodoTabView({this.theTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetBuilder<TodoController>(
            builder: (_dx) => ListView(
                  children: lookForItems(context),
                )));
  }

  List<Widget> lookForItems(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(ShoppingSectionCellWidget(title: "TO DO"));

    if (todoController.todo.length == 0) {
      widgetList.add(EmptyCellWidget(title: "...."));
    } else {
      for (int i = 0; i < todoController.todo.length; i++) {
        TodoModel todo = todoController.todo[i];
        widgetList.add(TodoCellWidget(todoModel: todo, index: i));
      }
    }

    widgetList.add(ShoppingSectionCellWidget(title: "DONE"));

    if (todoController.done.length == 0) {
      widgetList.add(EmptyCellWidget(title: "...."));
    } else {
      for (int i = 0; i < todoController.done.length; i++) {
        TodoModel done = todoController.done[i];
        widgetList.add(TodoCellWidget(todoModel: done, index: i));
      }
    }

    return widgetList;
  }
}
