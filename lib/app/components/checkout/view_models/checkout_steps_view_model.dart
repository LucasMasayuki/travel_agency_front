import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_payment_form_view_model.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_person_info_form_view_model.dart';
import 'package:travel_agency_front/app/repositories/checkout_repository.dart';
import 'package:travel_agency_front/app/utils/respository_result.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

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

const List<String> ALL_STEPS = [
  ITEMS_STEP,
  PERSON_STEP,
  PAYMENT_STEP,
];

abstract class _CheckoutStepsBase with Store {
  String prevStep = "";
  String nextStep = PERSON_STEP;

  @observable
  String currentStep = ITEMS_STEP;

  @observable
  RowViewDataAbstract item;

  @observable
  bool initializePersonInfoStep = false;

  @observable
  bool initializePaymentStep = false;

  @observable
  bool isFinishingOrder = false;

  @computed
  bool get showPrevButton => prevStep != "";

  @computed
  String get nextButtonText => nextStep != "" ? "Próximo" : "Fechar pedido";

  @computed
  String get prevButtonText => "Voltar";

  @action
  onClickStep(int step) {
    String selectedStep = ALL_STEPS[step];
    switch (selectedStep) {
      case ITEMS_STEP:
        this.onClickBackToItemsListStep();
        break;
      case PERSON_STEP:
        this.onClickGoToPersonInfoStep();
        break;
      case PAYMENT_STEP:
        this.onClickGoToPaymentInfoStep();
        break;
    }
    this.currentStep = selectedStep;
  }

  @action
  void onLoad(RowViewDataAbstract item) {
    this.item = item;
  }

  @action
  void onClickGoToPersonInfoStep() {
    this.currentStep = PERSON_STEP;
    this.nextStep = PAYMENT_STEP;
    this.prevStep = ITEMS_STEP;
    this.initializePersonInfoStep = true;
  }

  @action
  void onClickGoToPaymentInfoStep() {
    final CheckoutPersonInfoFormViewModel checkoutPersonInfoFormViewModel =
        Modular.get();

    if (checkoutPersonInfoFormViewModel.isValidForm) {
      this.currentStep = PAYMENT_STEP;
      this.nextStep = "";
      this.prevStep = PERSON_STEP;

      this.initializePaymentStep = true;
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
  Future<void> onClickFinishOrder() async {
    final CheckoutRepository repository = Modular.get();

    isFinishingOrder = true;
    var data = mountJsonToSendOnBody();
    RepositoryResult<String, String> response =
        await repository.finishOrder(data);

    if (response.success.isNotEmpty) {
      Modular.to.pushNamed('/checkout/checkoutDone');
    }
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
      "descricaoProduto": item.cartTitle,
      "email": checkoutPersonInfoFormViewModel.email,
      "nomeCliente": checkoutPersonInfoFormViewModel.completeName,
      "telefone": checkoutPersonInfoFormViewModel.telephone,
    };

    return data;
  }
}
