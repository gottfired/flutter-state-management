import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/getx/pages/home/theme_page.dart';
import '../../../components/theme_button.dart';
import '../../repos/theme_repo.dart';
import 'home_controller.dart';
import 'info_page.dart';

class HomePageGet extends GetView<HomeController> {
  Widget getPage() {
    switch (controller.currentPage.value) {
      case 0:
        return InfoPage();
      case 1:
        return ThemePage();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = ThemeRepo.instance;
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            Obx(
              () => ThemeButton(isDark: _theme.isDark.value, onPressed: _theme.toggleTheme),
            ),
          ],
        ),
        body: Obx(() => getPage()),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentPage.value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'Info',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.image),
                label: 'Theme',
              ),
            ],
            onTap: (index) {
              controller.changePage(index);
            },
          ),
        ));
  }
}
