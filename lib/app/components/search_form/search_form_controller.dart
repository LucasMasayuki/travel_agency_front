import 'package:mobx/mobx.dart';

part 'search_form_controller.g.dart';

class SearchFormController = _SearchFormBase with _$SearchFormController;

abstract class _SearchFormBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
