import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/repositories/email_repository.dart';

part 'send_email_dialog_view_model.g.dart';

class SendEmailDialogViewModel = _SendEmailDialogBase
    with _$SendEmailDialogViewModel;

abstract class _SendEmailDialogBase with Store {
  @observable
  String email;

  @action
  void sendEmail() {
    final EmailRepository repository = Modular.get();

    Map<String, dynamic> data = {
      "email": this.email,
    };

    repository.sendEmail(data);
  }

  @action
  void onChangeEmail(email) {
    this.email = email;
  }
}
