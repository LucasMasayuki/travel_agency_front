import 'package:intl/intl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/components/item_card/hotel_card.dart';
import 'package:travel_agency_front/app/models/hotel_model.dart';
import 'package:travel_agency_front/app/repositories/hotel_repository.dart';
import 'package:travel_agency_front/app/view_data/hotel_search_view_data.dart';
import 'package:travel_agency_front/app/view_data/hotel_view_data.dart';

part 'category_hotel_view_model.g.dart';

class CategoryHotelViewModel = _CategoryHotelBase with _$CategoryHotelViewModel;

abstract class _CategoryHotelBase with Store {
  @observable
  List<HotelCard> hotelViewData = [];

  @observable
  bool isLoading = true;

  String errorMessage;

  @computed
  bool get isEmptyPage => hotelViewData.isEmpty;

  @computed
  bool get hasError =>
      isLoading && errorMessage != null && errorMessage.isNotEmpty;

  @action
  Future<void> initialize() {
    HotelSearchViewData hotel = _getInitialHotel();

    return loadHotels(hotel);
  }

  @action
  Future<void> loadHotels(HotelSearchViewData hotel) async {
    final HotelRepository repository = Modular.get();

    isLoading = true;
    final result = await repository.getHotels(hotel);
    final viewDataList = _buildViewData(result.success ?? []);

    hotelViewData.addAll(viewDataList);
    errorMessage = result.error;
    isLoading = false;
  }

  List<HotelCard> _buildViewData(List<HotelModel> hotel) {
    if (hotel.isEmpty) {
      return [];
    }

    var viewDataList = <HotelCard>[];

    viewDataList.addAll(hotel.map((item) {
      return HotelCard(hotel: HotelViewData(hotel: item));
    }));

    return viewDataList;
  }

  HotelSearchViewData _getInitialHotel() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return HotelSearchViewData(
      adults: 1,
      checkIn: "2020-07-20",
      checkOut: "2020-07-30",
      destiny: "Posadas, Misiones, Argentina",
    );
  }
}
