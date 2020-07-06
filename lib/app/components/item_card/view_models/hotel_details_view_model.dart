import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/models/hotel_details_model.dart';
import 'package:travel_agency_front/app/repositories/hotel_details_repository.dart';
import 'package:travel_agency_front/app/view_data/hotel_details_view_data.dart';

part 'hotel_details_view_model.g.dart';

class HotelDetailsViewModel = _HotelDetailsBase with _$HotelDetailsViewModel;

abstract class _HotelDetailsBase with Store {
  @observable
  HotelDetailsViewData hotelDetailsViewData;

  @observable
  bool isLoading = true;

  @observable
  String errorMessage;

  @computed
  bool get isEmptyPage => hotelDetailsViewData == null;

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

    hotelDetailsViewData = _buildViewData(result.success ?? null);
    errorMessage = result.error;
    isLoading = false;
  }

  HotelDetailsViewData _buildViewData(
    HotelDetailsModel hotelDetail,
  ) {
    if (hotelDetail == null) {
      return null;
    }

    HotelDetailsViewData viewData =
        HotelDetailsViewData(hotelDetailsModel: hotelDetail);

    return viewData;
  }
}
