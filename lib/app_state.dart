import 'package:flutter/material.dart';


class AppState extends ChangeNotifier{
  int selectedCategory = 0;

  void updateCategoryId(int selectedCategoryId){
    this.selectedCategory = selectedCategoryId;
    notifyListeners();
  }
}