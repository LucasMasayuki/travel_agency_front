import 'package:intl/intl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/components/item_card/hotel_card.dart';
import 'package:travel_agency_front/app/interfaces/category_view_model_inferface.dart';
import 'package:travel_agency_front/app/models/hotel_model.dart';
import 'package:travel_agency_front/app/repositories/hotel_repository.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';
import 'package:travel_agency_front/app/view_data/hotel_search_view_data.dart';
import 'package:travel_agency_front/app/view_data/hotel_view_data.dart';

part 'category_hotel_view_model.g.dart';

class CategoryHotelViewModel = _CategoryHotelBase with _$CategoryHotelViewModel;

abstract class _CategoryHotelBase
    with Store
    implements CategoryViewModelInterface {
  @observable
  List<HotelCard> hotelViewData = [];

  @observable
  bool initialized = false;

  @observable
  bool isLoading = true;

  @observable
  String errorMessage;

  @computed
  bool get isEmptyPage => hotelViewData.isEmpty;

  @computed
  bool get hasError =>
      !isLoading && errorMessage != null && errorMessage.isNotEmpty;

  @action
  Future<void> initialize() {
    HotelSearchViewData hotel = _getInitialHotel();
    initialized = true;

    return loadCategoryData(hotel);
  }

  @action
  Future<void> loadCategoryData(RowViewDataAbstract hotel) async {
    final HotelRepository repository = Modular.get();

    isLoading = true;
    final result = await repository.getHotels(hotel);
    final viewDataList = _buildViewData(result.success ?? [], hotel);

    hotelViewData = [];
    hotelViewData.addAll(viewDataList);
    errorMessage = result.error;
    isLoading = false;
  }

  List<HotelCard> _buildViewData(
    List<HotelModel> hotel,
    RowViewDataAbstract searchHotelViewData,
  ) {
    if (hotel.isEmpty) {
      return [];
    }

    var viewDataList = <HotelCard>[];

    viewDataList.addAll(hotel.map((item) {
      return HotelCard(
        hotel: HotelViewData(hotel: item),
        hotelSearchViewData: searchHotelViewData,
      );
    }));

    return viewDataList;
  }

  HotelSearchViewData _getInitialHotel() {
    DateTime now = DateTime.now();
    DateTime fifthDaysAfterNow = DateTime.now().add(Duration(days: 15));
    String formatedCheckIn = DateFormat('yyyy-MM-dd').format(now);
    String formatedCheckOut =
        DateFormat('yyyy-MM-dd').format(fifthDaysAfterNow);
    return HotelSearchViewData(
      adults: 1,
      checkIn: formatedCheckIn,
      checkOut: formatedCheckOut,
      destiny: "Posadas, Misiones, Argentina",
    );
  }
}
