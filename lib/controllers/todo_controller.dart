import 'package:get/get.dart';
import 'package:bweird_flutter_toolkit/models/todo_model.dart';

class TodoController extends GetxController {
  // ignore: deprecated_member_use
  var _todo = List<TodoModel>().obs;

// ignore: deprecated_member_use
  var _done = List<TodoModel>().obs;

  get todo => this._todo;
  get done => this._done;

  void mItem(List<TodoModel> item) {
    this._todo.value = item;
  }

  void addToDone(int itemIndex, TodoModel value) {
    this._todo.removeAt(itemIndex);
    value.isSelected = true;
    this._done.add(value);
    refresh();
  }

  void addToTodo(int itemIndex, TodoModel value) {
    this._done.removeAt(itemIndex);
    value.isSelected = false;
    this._todo.add(value);
    refresh();
  }

  void loadData() async {
    List itemList = [
      {"id": "001", "title": "clean bathroom"},
      {"id": "002", "title": "cook dinner"},
      {"id": "002", "title": "finalized project"}
    ];

    List<TodoModel> list = itemList.map((e) => TodoModel.fromJson(e)).toList();
    mItem(list);
  }

  void mItemByindex(bool isCheck, TodoModel value) {
    this._todo.add(value);
    refresh();
  }

  @override
  void onInit() {
    super.onInit();

    //initial data
    this.loadData();
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
