import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

abstract class SearchViewModelInterface {
  RowViewDataAbstract getSearchData() {}
  bool get isValidForm {}
}
