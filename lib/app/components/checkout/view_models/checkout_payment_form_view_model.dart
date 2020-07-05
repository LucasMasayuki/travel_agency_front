import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'checkout_payment_form_view_model.g.dart';

class CheckoutPaymentFormViewModel = _CheckoutPaymentFormBase
    with _$CheckoutPaymentFormViewModel;

abstract class _CheckoutPaymentFormBase with Store {
  @observable
  String cvc = "";

  @observable
  String name = "";

  @observable
  double total;

  @observable
  String expiration = "";

  @observable
  String numbers = "";

  @observable
  int plots = 1;

  @computed
  bool get isValidForm =>
      isValidCvc() &&
      isValidName() &&
      isValidExpiration() &&
      isValidNumbers() &&
      isValidPlots();

  @action
  void onChangeCvc(cvc) {
    this.cvc = cvc;
  }

  @action
  void onChangeName(name) {
    this.name = name;
  }

  @action
  void onChangeTotal(total) {
    this.total = total;
  }

  @action
  void onChangeExpiration(expiration) {
    this.expiration = expiration;
  }

  @action
  void onChangeNumber(numbers) {
    this.numbers = numbers;
  }

  @action
  void onChangePlots(plots) {
    this.plots = plots;
  }

  bool isValidCvc() {
    return this.cvc.isNotEmpty;
  }

  bool isValidName() {
    return this.name.isNotEmpty;
  }

  bool isValidTotal() {
    return this.total != null && this.total > 0;
  }

  bool isValidExpiration() {
    return this.expiration.isNotEmpty;
  }

  bool isValidNumbers() {
    return isCreditCard(this.numbers);
  }

  bool isValidPlots() {
    return this.plots != null && this.plots > 0;
  }
}
