import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class CarRentalSearchViewData implements RowViewDataAbstract {
  final String location;
  final String returnDate;
  final String withdrawalDate;

  CarRentalSearchViewData({
    this.location,
    this.returnDate,
    this.withdrawalDate,
  });
}
