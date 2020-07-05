import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/checkout/checkout_item_widget.dart';
import 'package:travel_agency_front/app/components/checkout/checkout_payment_form.dart';
import 'package:travel_agency_front/app/components/checkout/checkout_person_info_form.dart';
import 'package:travel_agency_front/app/components/checkout/checkout_steps_button_group.dart';
import 'package:travel_agency_front/app/components/checkout/finish_checkout_loading_widget.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_person_info_form_view_model.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_steps_view_model.dart';
import 'package:travel_agency_front/app/components/empty_page/empty_page_widget.dart';
import 'package:travel_agency_front/app/utils/row_view_data_abstract.dart';

class CheckoutStepsWidget extends StatefulWidget {
  final RowViewDataAbstract item;
  const CheckoutStepsWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  _CheckoutStepsWidgetState createState() => _CheckoutStepsWidgetState();
}

class _CheckoutStepsWidgetState extends State<CheckoutStepsWidget> {
  final CheckoutStepsViewModel checkoutStepsViewModel = Modular.get();
  final CheckoutPersonInfoFormViewModel checkoutPersonInfoFormViewModel =
      Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Observer(builder: (_) {
        if (this.widget.item == null) {
          EmptyPageWidget();
        }

        if (checkoutStepsViewModel.isFinishingOrder) {
          FinishCheckoutLoadingWidget();
        }

        return _builderStep();
      }),
    );
  }

  getSteps() {
    StepState personStepState = StepState.indexed;

    if (checkoutPersonInfoFormViewModel.isValidForm) {
      personStepState = StepState.complete;
    } else if (checkoutStepsViewModel.currentStep == PERSON_STEP) {
      personStepState = StepState.editing;
    }

    List<Step> steps = [
      Step(
        title: Text("Detalhes da compra"),
        isActive: checkoutStepsViewModel.currentStep == ITEMS_STEP,
        state: StepState.complete,
        content: CheckoutItemWidget(item: this.widget.item),
      ),
      Step(
        title: Text("Comprador"),
        isActive: checkoutStepsViewModel.currentStep == PERSON_STEP,
        state: personStepState,
        content: CheckoutPersonInfoForm(),
      ),
      Step(
        isActive: checkoutStepsViewModel.currentStep == PAYMENT_STEP,
        title: Text("Pagamento"),
        content: CheckoutPaymentForm(),
      ),
    ];

    return steps;
  }

  Widget _builderStep() => Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Stepper(
            type: StepperType.vertical,
            steps: getSteps(),
            currentStep: STEPS[checkoutStepsViewModel.currentStep],
            onStepTapped: (step) => checkoutStepsViewModel.onClickNext(),
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return CheckoutStepsButtonGroup(
                nextButtonText: checkoutStepsViewModel.nextButtonText,
                prevButtonText: checkoutStepsViewModel.prevButtonText,
                onClickNext: checkoutStepsViewModel.onClickNext,
                onClickPrev: checkoutStepsViewModel.onClickPrev,
                showPrevButton: checkoutStepsViewModel.showPrevButton,
              );
            },
          ),
        ),
      );
}
