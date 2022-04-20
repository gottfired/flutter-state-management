import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/getx/pages/home/theme_page_get.dart';
import '../../../shared/components/theme_button.dart';
import '../../../shared/states/theme_state.dart';
import '../../repos/theme_repo.dart';
import 'home_controller.dart';
import 'info_page_get.dart';

class HomePageGet extends GetView<HomeController> {
  Widget getPage() {
    switch (controller.homeState.value.index) {
      case 0:
        return InfoPageGet();
      case 1:
        return ThemePageGet();
      default:
        return InfoPageGet();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _themeRepo = ThemeRepo.instance;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            Obx(
              () => ThemeButton(isDark: _themeRepo.theme.value is DarkTheme, onPressed: _themeRepo.toggleTheme),
            ),
          ],
        ),
        body: Obx(() => getPage()),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.homeState.value.index,
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
