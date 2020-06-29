import 'package:mobx/mobx.dart';

part 'categories_view_model.g.dart';

class CategoriesViewModel = _CategoriesBase with _$CategoriesViewModel;

abstract class _CategoriesBase with Store {
  @observable
  String currentTab = "hotel";

  @action
  void onChangeView(viewId) {
    currentTab = _mapIndexToTab(viewId);
  }

  String _mapIndexToTab(viewId) {
    const tabs = [
      "hotel",
      "flight",
      "car",
    ];

    return tabs[viewId];
  }
}
