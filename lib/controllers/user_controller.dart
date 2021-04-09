import 'package:get/get.dart';
import 'package:personal_shopper/models/user_model.dart';

class UserController extends GetxController {
  var _user = UserModel().obs;
  get user => this._user.value;

  mUser(UserModel user) {
    this._user.value = user;
  }

  initUser() async {
    UserModel user = await UserModel.getCurrentUser();
    mUser(user);
  }

  @override
  void onInit() {
    super.onInit();
    initUser();
  }
}
