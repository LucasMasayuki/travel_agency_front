import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';
import 'package:travel_agency_front/app/view_data/flight_search_view_data.dart';

part 'categories_view_model.g.dart';

class CategoriesViewModel = _CategoriesBase with _$CategoriesViewModel;

abstract class _CategoriesBase with Store {
  @observable
  bool isLoading = false;

  @observable
  int currentChosenTabIndex = 0;

  @action
  void onChangeView(viewId) {
    currentChosenTabIndex = viewId;
  }
}
