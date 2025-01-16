import 'package:flutter/material.dart';
import 'package:food_recipes_app/ui/favorites/view/favorites_view.dart';
import 'package:food_recipes_app/ui/home/view/home_screen_view.dart';
import 'package:food_recipes_app/ui/main_menu/controller/main_menu_controller.dart';
import 'package:food_recipes_app/ui/profile/view/profile_view.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainMenu extends StatelessWidget {
  MainMenu({super.key});
  final MainMenuController mainMenuController = Get.put(MainMenuController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: mainMenuController.selectedIndex.value == 0
            ? HomeScreenView()
            : mainMenuController.selectedIndex.value == 1
                ? const FavoritesView()
                : const ProfileView(),
        bottomNavigationBar: Obx(
          () => SalomonBottomBar(
            onTap: (p0) {
              mainMenuController.selectedIndex.value = p0;
            },
            currentIndex: mainMenuController.selectedIndex.value,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text(
                  "Ana Sayfa",
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.favorite),
                title: const Text(
                  "Favoriler",
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.flatware),
                title: const Text(
                  "Tüm Tarifler",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
