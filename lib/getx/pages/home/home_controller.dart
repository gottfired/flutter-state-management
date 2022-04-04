import 'package:get/get.dart';

class HomeController extends GetxController {

  final currentPage = 0.obs;

  void changePage(int page) {
    currentPage.value = page;
  }
}