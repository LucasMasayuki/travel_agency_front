import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

abstract class SearchViewModelInterface {
  // ignore: missing_return
  RowViewDataAbstract getSearchData() {}
  // ignore: missing_return
  bool get isValidForm {}
}
