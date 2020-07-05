import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/components/item_card/hotel_card.dart';
import 'package:travel_agency_front/app/models/hotel_details_model.dart';
import 'package:travel_agency_front/app/repositories/hotel_details_repository.dart';

part 'hotel_details_view_model.g.dart';

class HotelDetailsViewModel = _HotelDetailsBase with _$HotelDetailsViewModel;

abstract class _HotelDetailsBase with Store {
  @observable
  List<HotelCard> hotelDetailsViewData = [];

  @observable
  bool isLoading = true;

  @observable
  String errorMessage;

  @computed
  bool get isEmptyPage => hotelDetailsViewData.isEmpty;

  @computed
  bool get hasError =>
      !isLoading && errorMessage != null && errorMessage.isNotEmpty;

  @action
  Future<void> getHotelDetails(hotelDetailsQueryParam) async {
    final HotelDetailsRepository repository = Modular.get();

    isLoading = true;
    final result = await repository.getHotelDetails(
      hotelDetailsQueryParam.hotelId,
      hotelDetailsQueryParam.adults,
      hotelDetailsQueryParam.checkIn,
      hotelDetailsQueryParam.checkOut,
    );

    final viewDataList = _buildViewData(result.success ?? []);

    hotelDetailsViewData = [];
    hotelDetailsViewData.addAll(viewDataList);
    errorMessage = result.error;
    isLoading = false;
  }

  List<HotelCard> _buildViewData(
    List<HotelDetailsModel> hotel,
  ) {
    if (hotel.isEmpty) {
      return [];
    }

    var viewDataList = <HotelCard>[];

    return viewDataList;
  }
}
