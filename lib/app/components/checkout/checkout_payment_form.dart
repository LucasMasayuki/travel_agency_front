import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_payment_form_view_model.dart';
import 'package:travel_agency_front/app/components/inputs/text_form_field_custom.dart';
import 'package:travel_agency_front/app/utils/media_helper.dart';

class CheckoutPaymentForm extends StatefulWidget {
  const CheckoutPaymentForm({
    Key key,
  }) : super(key: key);

  @override
  _CheckoutPaymentFormState createState() => _CheckoutPaymentFormState();
}

class _CheckoutPaymentFormState extends State<CheckoutPaymentForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getFormInputs(context),
    );
  }

  List<Widget> _getFormInputs(BuildContext context) {
    final CheckoutPaymentFormViewModel checkoutPaymentFormViewModel =
        Modular.get();

    List<Widget> formInputs = [];

    if (MediaHelper.isFromApps()) {
      formInputs.add(
        Observer(
          builder: (_) {
            return CreditCard(
              cardNumber: checkoutPaymentFormViewModel.numbers,
              cardExpiry: checkoutPaymentFormViewModel.expiration,
              cardHolderName: checkoutPaymentFormViewModel.name,
              cvv: checkoutPaymentFormViewModel.cvc,
              bankName: "teste",
              showBackSide: false,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              showShadow: true,
            );
          },
        ),
      );
    }

    formInputs.add(_numbersRowWidget(checkoutPaymentFormViewModel));
    formInputs.add(_nameRowWidget(checkoutPaymentFormViewModel));
    formInputs.add(_dateExpireAndCvcRowWidget(checkoutPaymentFormViewModel));

    return formInputs;
  }

  Widget _numbersRowWidget(
    CheckoutPaymentFormViewModel checkoutPaymentFormViewModel,
  ) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextFormFieldCustom(
              keyboardType: TextInputType.number,
              hintText: 'Número do cartão',
              maxLength: 19,
              onChanged: checkoutPaymentFormViewModel.onChangeNumber,
              prefixIcon: Icon(Icons.person),
              validator: (_) {
                return !checkoutPaymentFormViewModel.isValidNumbers()
                    ? 'Preencha corretamente o numero do seu cartão'
                    : null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _nameRowWidget(
    CheckoutPaymentFormViewModel checkoutPaymentFormViewModel,
  ) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextFormFieldCustom(
              keyboardType: TextInputType.number,
              hintText: 'Nome do titular',
              onChanged: checkoutPaymentFormViewModel.onChangeName,
              prefixIcon: Icon(Icons.person),
              validator: (_) {
                return !checkoutPaymentFormViewModel.isValidName()
                    ? 'Preencha o titular'
                    : null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _dateExpireAndCvcRowWidget(
    CheckoutPaymentFormViewModel checkoutPaymentFormViewModel,
  ) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextFormFieldCustom(
              keyboardType: TextInputType.number,
              hintText: 'Validade',
              onChanged: checkoutPaymentFormViewModel.onChangeExpiration,
              prefixIcon: Icon(Icons.person),
              maxLength: 5,
              validator: (_) {
                return !checkoutPaymentFormViewModel.isValidExpiration()
                    ? 'Preencha data de expiração'
                    : null;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextFormFieldCustom(
              keyboardType: TextInputType.number,
              hintText: 'CVV',
              maxLength: 3,
              onChanged: checkoutPaymentFormViewModel.onChangeCvc,
              prefixIcon: Icon(Icons.person),
              validator: (_) {
                return !checkoutPaymentFormViewModel.isValidCvc()
                    ? 'Preencha o cvv'
                    : null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
