import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

abstract class CategoryViewModelInterface {
  Future<void> loadCategoryData(RowViewDataAbstract searchViewModelInterface) {}
}
