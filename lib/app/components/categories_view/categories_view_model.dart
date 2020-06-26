import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'categories_view_model.g.dart';

class CategoriesViewModel = _CategoriesBase with _$CategoriesViewModel;

abstract class _CategoriesBase with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isEmpty = false;

  @observable
  int currentChosenTabIndex = 0;

  @observable
  List<Widget> items = [];

  @action
  void onChangeView(viewId) {
    currentChosenTabIndex = viewId;
    items = [];
    isLoading = true;
    isEmpty = true;
  }

  @action
  void onLoadData() {
    isLoading = false;
    isEmpty = isEmpty;
  }
}
