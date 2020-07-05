import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_payment_form_view_model.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_person_info_form_view_model.dart';
import 'package:travel_agency_front/app/repositories/checkout_repository.dart';

part 'checkout_steps_view_model.g.dart';

class CheckoutStepsViewModel = _CheckoutStepsBase with _$CheckoutStepsViewModel;

const PERSON_STEP = "persons_info";
const PAYMENT_STEP = "payment_info";
const ITEMS_STEP = "items_list";

const STEPS = {
  ITEMS_STEP: 0,
  PERSON_STEP: 1,
  PAYMENT_STEP: 2,
};

abstract class _CheckoutStepsBase with Store {
  String prevStep = "";
  String nextStep = PERSON_STEP;

  @observable
  String currentStep = ITEMS_STEP;

  @observable
  bool isFinishingOrder = false;

  @observable
  bool SuccessfulFinishOrder = false;

  @computed
  bool get showPrevButton => prevStep != "";

  @computed
  String get nextButtonText => nextStep != "" ? "Próximo" : "Fechar pedido";

  @computed
  String get prevButtonText => "Voltar";

  @action
  void onClickGoToPersonInfoStep() {
    this.currentStep = PERSON_STEP;
    this.nextStep = PAYMENT_STEP;
    this.prevStep = ITEMS_STEP;
  }

  @action
  void onClickGoToPaymentInfoStep() {
    final CheckoutPersonInfoFormViewModel checkoutPersonInfoFormViewModel =
        Modular.get();

    if (checkoutPersonInfoFormViewModel.isValidForm) {
      this.currentStep = PAYMENT_STEP;
      this.nextStep = "";
      this.prevStep = PERSON_STEP;
    }
  }

  @action
  void onClickBackToItemsListStep() {
    this.currentStep = ITEMS_STEP;
    this.nextStep = PERSON_STEP;
    this.prevStep = "";
  }

  @action
  void onBackGoToPersonsInfoStep() {
    this.currentStep = PERSON_STEP;
    this.nextStep = PAYMENT_STEP;
    this.prevStep = ITEMS_STEP;
  }

  @action
  void onClickFinishOrder() {
    final CheckoutRepository repository = Modular.get();

    var data = mountJsonToSendOnBody();
    repository.finishOrder(data);
  }

  @action
  void onClickNext() {
    switch (this.currentStep) {
      case ITEMS_STEP:
        this.onClickGoToPersonInfoStep();
        break;
      case PERSON_STEP:
        this.onClickGoToPaymentInfoStep();
        break;
      case PAYMENT_STEP:
        this.onClickFinishOrder();
        break;
    }
  }

  @action
  void onClickPrev() {
    switch (this.currentStep) {
      case PERSON_STEP:
        this.onClickBackToItemsListStep();
        break;
      case PAYMENT_STEP:
        this.onClickGoToPersonInfoStep();
        break;
    }
  }

  Map<String, dynamic> mountJsonToSendOnBody() {
    final CheckoutPersonInfoFormViewModel checkoutPersonInfoFormViewModel =
        Modular.get();
    final CheckoutPaymentFormViewModel checkoutPaymentFormViewModel =
        Modular.get();

    Map<String, dynamic> data = {
      "beneficiario": [
        {
          "dataNascimento": checkoutPersonInfoFormViewModel.birthDay,
          "nome": checkoutPersonInfoFormViewModel.completeName,
          "numeroDocumento": checkoutPersonInfoFormViewModel.document,
          "tipoDocumento": "cpf",
          "ultimoSobrenome": checkoutPersonInfoFormViewModel.lastName,
        }
      ],
      "cartão": {
        "codigoSeguranca": checkoutPaymentFormViewModel.cvc,
        "cpfTitular": checkoutPersonInfoFormViewModel.document,
        "numero": checkoutPaymentFormViewModel.numbers,
        "parcelas": checkoutPaymentFormViewModel.plots,
        "titular": checkoutPaymentFormViewModel.name,
        "valorTotal": 0,
        "vencimento": checkoutPaymentFormViewModel.expiration,
      },
      "cep": checkoutPersonInfoFormViewModel.zipcode,
      "cpf": checkoutPersonInfoFormViewModel.document,
      "descricaoProduto": "",
      "email": checkoutPersonInfoFormViewModel.email,
      "id": 1,
      "nomeCliente": checkoutPersonInfoFormViewModel.completeName,
      "telefone": checkoutPersonInfoFormViewModel.telephone,
    };
    return data;
  }
}