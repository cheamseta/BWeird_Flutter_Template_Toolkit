
import 'package:get/get.dart';

class TabIndexController extends GetxController {
  final _selectedBodyIndex = 0.obs;
  get selectedBodyIndex => this._selectedBodyIndex.value;
  set selectedBodyIndex(int index) => this._selectedBodyIndex.value = index;
}