import 'package:mobx/mobx.dart';

part 'search_item_view_model.g.dart';

class SearchItemViewModel = _SearchItemBase with _$SearchItemViewModel;

abstract class _SearchItemBase with Store {
  @observable
  bool isSearching = false;

  @action
  void onSearch(isSearching) {
    this.isSearching = isSearching;
  }
}
