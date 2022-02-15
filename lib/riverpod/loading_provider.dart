import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingNotifier extends ChangeNotifier {
  bool isLoading = false;

  void setLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }
}

final loadingProvider = ChangeNotifierProvider((ref) => LoadingNotifier());
