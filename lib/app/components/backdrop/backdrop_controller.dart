import 'package:mobx/mobx.dart';

part 'backdrop_controller.g.dart';

class BackdropController = _BackdropBase with _$BackdropController;

abstract class _BackdropBase with Store {
  @observable
  int currentChosenTabIndex = 0;

  @action
  void onSelectTab(chosenTab) {
    currentChosenTabIndex = chosenTab;
  }
}
