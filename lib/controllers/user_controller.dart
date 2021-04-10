import 'package:get/get.dart';
import 'package:bweird_flutter_toolkit/models/user_model.dart';

class UserController extends GetxController {

  var _isEdited = false.obs;
  get isEdited => this._isEdited.value;

  var _user = UserModel().obs;
  get user => this._user.value;

  mEditForm() {
    this._isEdited.value = !this._isEdited.value;
  }

  mUser(UserModel user) {
    this._user.value = user;
  }

  mUsername(String username) {
    UserModel user = this._user.value;
    user.username = username;
  }

    mAge(String age) {
    UserModel user = this._user.value;
    user.age = age;
  }

  initUser() async {
    UserModel user = await UserModel.getCurrentUser();
    mUser(user);
  }

  @override
  void onInit() {
    super.onInit();

  }
}
