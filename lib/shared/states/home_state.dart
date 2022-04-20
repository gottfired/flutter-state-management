abstract class HomeState {
  late final int index;
}

class InfoPage extends HomeState {
  InfoPage() {
    index = 0;
  }
}

class ThemePage extends HomeState {
  ThemePage() {
    index = 1;
  }
}
