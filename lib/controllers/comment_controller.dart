import 'package:get/get.dart';
import 'package:personal_shopper/models/comment_model.dart';

class CommentController extends GetxController {
  final _category = "".obs;
  get category => this._category.value;
  setCategory(String value) {
    if (value == "ផ្សេងទៀត") {
   this._category.value = "";
    }else{
   this._category.value = value;
    }
 
  }

  var _comment = CommentModel().obs;
  get comment => this._comment.value;

  void mComment(CommentModel comment) {
    this._comment.value = comment;
  }

  void mInitCategoryValue(CommentModel value) {
    this._comment.value = value;
    update();
  }
}
