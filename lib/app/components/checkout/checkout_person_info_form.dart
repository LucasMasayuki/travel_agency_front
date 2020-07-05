import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:travel_agency_front/app/components/checkout/view_models/checkout_person_info_form_view_model.dart';
import 'package:travel_agency_front/app/components/date_picker_field/date_picker_field.dart';
import 'package:travel_agency_front/app/components/inputs/text_form_field_custom.dart';
import 'package:travel_agency_front/app/utils/media_helper.dart';

class CheckoutPersonInfoForm extends StatefulWidget {
  const CheckoutPersonInfoForm({
    Key key,
  }) : super(key: key);

  @override
  _CheckoutPersonInfoFormState createState() => _CheckoutPersonInfoFormState();
}

class _CheckoutPersonInfoFormState extends State<CheckoutPersonInfoForm> {
  bool isMobile = false;
  final CheckoutPersonInfoFormViewModel checkoutPersonInfoFormViewModel =
      Modular.get();

  @override
  Widget build(BuildContext context) {
    isMobile = MediaHelper.isMobile(context);
    return Form(
      child: Column(
        children: _getFormInputs(context),
      ),
    );
  }

  List<Widget> _getFormInputs(BuildContext context) {
    if (isMobile) {
      return _mountMobileForm();
    }

    return _mountDesktopForm();
  }

  List<Widget> _mountMobileForm() {
    const EdgeInsets padding = EdgeInsets.only(
      top: 10,
      bottom: 10,
    );

    List<Widget> inputListForm = [
      Padding(
        padding: padding,
        child: nameInput,
      ),
      Padding(
        padding: padding,
        child: lastNameInput,
      ),
      Padding(
        padding: padding,
        child: documentInput,
      ),
      Padding(
        padding: padding,
        child: emailInput,
      ),
      Padding(
        padding: padding,
        child: zipcodeInput,
      ),
      Padding(
        padding: padding,
        child: telephoneInput,
      ),
      Padding(
        padding: padding,
        child: _birthdayRowWidget(),
      ),
    ];

    return inputListForm;
  }

  List<Widget> _mountDesktopForm() {
    const EdgeInsets padding = EdgeInsets.all(20);
    List<Widget> inputListForm = [
      Padding(
        padding: padding,
        child: _nameAndLastNameRowWidget(),
      ),
      Padding(
        padding: padding,
        child: _documentAndEmailRowWidget(),
      ),
      Padding(
        padding: padding,
        child: _birthdayRowWidget(),
      ),
      Padding(
        padding: padding,
        child: _zipcodeAndTelephoneRowWidget(),
      ),
    ];

    return inputListForm;
  }

  Widget get nameInput => TextFormFieldCustom(
        contentPadding: isMobile ? EdgeInsets.all(0) : null,
        fontSize: isMobile ? 10 : null,
        keyboardType: TextInputType.number,
        hintText: 'Primeiro nome',
        onChanged: checkoutPersonInfoFormViewModel.onChangeName,
        prefixIcon: Icon(Icons.person),
        validator: (_) {
          return !checkoutPersonInfoFormViewModel.isValidName()
              ? 'Preencha o seu primeiro nome'
              : null;
        },
      );

  Widget get lastNameInput => TextFormFieldCustom(
        contentPadding: isMobile ? EdgeInsets.all(0) : null,
        fontSize: isMobile ? 10 : null,
        keyboardType: TextInputType.number,
        hintText: 'Sobrenome',
        onChanged: checkoutPersonInfoFormViewModel.onChangeLastName,
        prefixIcon: Icon(Icons.person),
        validator: (_) {
          return !checkoutPersonInfoFormViewModel.isValidLastName()
              ? 'Preencha o seu último nome'
              : null;
        },
      );

  Widget get documentInput => TextFormFieldCustom(
        contentPadding: isMobile ? EdgeInsets.all(0) : null,
        fontSize: isMobile ? 10 : null,
        hintText: 'CPF',
        inputFormatters: [MaskTextInputFormatter(mask: '###.###.###-##')],
        onChanged: checkoutPersonInfoFormViewModel.onChangeDocument,
        prefixIcon: Icon(Icons.person),
        validator: (_) {
          return !checkoutPersonInfoFormViewModel.isValidDocument()
              ? 'Preencha o seu CPF'
              : null;
        },
      );

  Widget get emailInput => TextFormFieldCustom(
        contentPadding: isMobile ? EdgeInsets.all(0) : null,
        fontSize: isMobile ? 10 : null,
        keyboardType: TextInputType.emailAddress,
        hintText: 'Email',
        onChanged: checkoutPersonInfoFormViewModel.onChangeEmail,
        prefixIcon: Icon(Icons.email),
        validator: (_) {
          return !checkoutPersonInfoFormViewModel.isValidEmail()
              ? 'Preencha o seu email'
              : null;
        },
      );

  Widget get zipcodeInput => TextFormFieldCustom(
        keyboardType: TextInputType.number,
        contentPadding: isMobile ? EdgeInsets.all(0) : null,
        fontSize: isMobile ? 10 : null,
        inputFormatters: [MaskTextInputFormatter(mask: '########')],
        hintText: 'CEP',
        onChanged: checkoutPersonInfoFormViewModel.onChangeZipcode,
        prefixIcon: Icon(Icons.person),
        validator: (_) {
          return !checkoutPersonInfoFormViewModel.isValidZipcode()
              ? 'Preencha o seu CEP'
              : null;
        },
      );

  Widget get telephoneInput => TextFormFieldCustom(
        contentPadding: isMobile ? EdgeInsets.all(0) : null,
        fontSize: isMobile ? 10 : null,
        keyboardType: TextInputType.number,
        hintText: 'Telefone',
        onChanged: checkoutPersonInfoFormViewModel.onChangeTelephone,
        prefixIcon: Icon(Icons.phone),
        validator: (_) {
          return !checkoutPersonInfoFormViewModel.isValidTelephone()
              ? 'Preencha o seu telefone'
              : null;
        },
      );

  Widget _nameAndLastNameRowWidget() {
    Widget nameAndLastNameRowWidget = Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: nameInput,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: lastNameInput,
          ),
        )
      ],
    );

    return nameAndLastNameRowWidget;
  }

  Widget _documentAndEmailRowWidget() {
    Widget documentAndEmailWidget = Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: documentInput,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: emailInput,
          ),
        )
      ],
    );

    return documentAndEmailWidget;
  }

  Widget _zipcodeAndTelephoneRowWidget() {
    Widget zipcodeAndTelephoneWidget = Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: zipcodeInput,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: telephoneInput,
          ),
        )
      ],
    );

    return zipcodeAndTelephoneWidget;
  }

  Widget _birthdayRowWidget() {
    TextEditingController birthDayController = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: DatePickerField(
              onChangeFormatter: "yyyy-MM-dd",
              contentPadding: isMobile ? EdgeInsets.all(0) : null,
              fontSize: isMobile ? 10 : null,
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
