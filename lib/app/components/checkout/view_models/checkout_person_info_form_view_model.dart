import 'package:mobx/mobx.dart';
part 'checkout_person_info_form_view_model.g.dart';

class CheckoutPersonInfoFormViewModel = _CheckoutPersonInfoFormBase
    with _$CheckoutPersonInfoFormViewModel;

abstract class _CheckoutPersonInfoFormBase with Store {
  final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  );

  @observable
  String birthDay;

  @observable
  String name;

  @observable
  String document;

  @observable
  String lastName;

  @observable
  String zipcode;

  @observable
  String email;

  @observable
  String telephone;

  @computed
  bool get isValidForm =>
      isValidBirthDay() &&
      isValidName() &&
      isValidDocument() &&
      isValidLastName();

  @computed
  String get completeName => "${this.name} ${this.lastName}";

  @action
  void onChangeBirthDay(birthDay) {
    this.birthDay = birthDay;
  }

  @action
  void onChangeName(name) {
    this.name = name;
  }

  @action
  void onChangeDocument(document) {
    this.document = document;
  }

  @action
  void onChangeLastName(lastName) {
    this.lastName = lastName;
  }

  @action
  void onChangeEmail(email) {
    this.email = email;
  }

  @action
  void onChangeTelephone(telephone) {
    this.telephone = telephone;
  }

  @action
  void onChangeZipcode(zipcode) {
    this.zipcode = zipcode;
  }

  bool isValidBirthDay() {
    return this.birthDay != null && this.birthDay.isNotEmpty;
  }

  bool isValidName() {
    return this.name != null && this.name.isNotEmpty;
  }

  bool isValidDocument() {
    return this.document != null && this.document.isNotEmpty;
  }

  bool isValidLastName() {
    return this.lastName != null && this.lastName.isNotEmpty;
  }

  bool isValidEmail() {
    return this.email != null && _emailRegExp.hasMatch(email) ||
        this.email.isNotEmpty;
  }

  bool isValidZipcode() {
    return this.zipcode != null && this.zipcode.isNotEmpty;
  }

  bool isValidTelephone() {
    return this.telephone != null && this.telephone.isNotEmpty;
  }
}
