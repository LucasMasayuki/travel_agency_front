import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_person_info_form_view_model.dart';
import 'package:travel_agency_front/app/components/date_picker_field/date_picker_field.dart';
import 'package:travel_agency_front/app/components/inputs/text_form_field_custom.dart';

class CheckoutPersonInfoForm extends StatefulWidget {
  const CheckoutPersonInfoForm({
    Key key,
  }) : super(key: key);

  @override
  _CheckoutPersonInfoFormState createState() => _CheckoutPersonInfoFormState();
}

class _CheckoutPersonInfoFormState extends State<CheckoutPersonInfoForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getFormInputs(),
    );
  }

  List<Widget> _getFormInputs() {
    final CheckoutPersonInfoFormViewModel checkoutPersonInfoFormViewModel =
        Modular.get();
    const EdgeInsets padding = EdgeInsets.all(20);

    return [
      Padding(
        padding: padding,
        child: _nameAndLastNameRowWidget(checkoutPersonInfoFormViewModel),
      ),
      Padding(
        padding: padding,
        child: _documentAndEmailRowWidget(checkoutPersonInfoFormViewModel),
      ),
      Padding(
        padding: padding,
        child: _birthdayRowWidget(checkoutPersonInfoFormViewModel),
      ),
      Padding(
        padding: padding,
        child: _zipcodeAndTelephoneRowWidget(checkoutPersonInfoFormViewModel),
      ),
    ];
  }

  Widget _nameAndLastNameRowWidget(
    CheckoutPersonInfoFormViewModel checkoutPersonInfoFormViewModel,
  ) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextFormFieldCustom(
              keyboardType: TextInputType.number,
              hintText: 'Primeiro nome',
              onChanged: checkoutPersonInfoFormViewModel.onChangeName,
              prefixIcon: Icon(Icons.person),
              validator: (_) {
                return !checkoutPersonInfoFormViewModel.isValidName()
                    ? 'Preencha o seu primeiro nome'
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
              hintText: 'Sobrenome',
              onChanged: checkoutPersonInfoFormViewModel.onChangeLastName,
              prefixIcon: Icon(Icons.person),
              validator: (_) {
                return !checkoutPersonInfoFormViewModel.isValidLastName()
                    ? 'Preencha o seu último nome'
                    : null;
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _documentAndEmailRowWidget(
    CheckoutPersonInfoFormViewModel checkoutPersonInfoFormViewModel,
  ) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextFormFieldCustom(
              hintText: 'CPF',
              inputFormatters: [MaskTextInputFormatter(mask: '###.###.###-##')],
              onChanged: checkoutPersonInfoFormViewModel.onChangeDocument,
              prefixIcon: Icon(Icons.person),
              validator: (_) {
                return !checkoutPersonInfoFormViewModel.isValidDocument()
                    ? 'Preencha o seu CPF'
                    : null;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextFormFieldCustom(
              keyboardType: TextInputType.emailAddress,
              hintText: 'Email',
              onChanged: checkoutPersonInfoFormViewModel.onChangeEmail,
              prefixIcon: Icon(Icons.email),
              validator: (_) {
                return !checkoutPersonInfoFormViewModel.isValidEmail()
                    ? 'Preencha o seu email'
                    : null;
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _zipcodeAndTelephoneRowWidget(
    CheckoutPersonInfoFormViewModel checkoutPersonInfoFormViewModel,
  ) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextFormFieldCustom(
              keyboardType: TextInputType.number,
              inputFormatters: [MaskTextInputFormatter(mask: '########')],
              hintText: 'CEP',
              onChanged: checkoutPersonInfoFormViewModel.onChangeZipcode,
              prefixIcon: Icon(Icons.person),
              validator: (_) {
                return !checkoutPersonInfoFormViewModel.isValidZipcode()
                    ? 'Preencha o seu CEP'
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
              hintText: 'Telefone',
              onChanged: checkoutPersonInfoFormViewModel.onChangeTelephone,
              prefixIcon: Icon(Icons.phone),
              validator: (_) {
                return !checkoutPersonInfoFormViewModel.isValidTelephone()
                    ? 'Preencha o seu telefone'
                    : null;
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _birthdayRowWidget(
    CheckoutPersonInfoFormViewModel checkoutPersonInfoFormViewModel,
  ) {
    TextEditingController birthDayController = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: DatePickerField(
              hintText: 'Data de aniversário',
              onChanged: checkoutPersonInfoFormViewModel.onChangeBirthDay,
              controller: birthDayController,
              validator: (_) {
                return !checkoutPersonInfoFormViewModel.isValidBirthDay()
                    ? 'Preencha a data de aniversário'
                    : null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
