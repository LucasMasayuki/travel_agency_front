import 'package:mobx/mobx.dart';

part 'front_layer_view_model.g.dart';

class FrontLayerViewModel = _FrontLayerBase with _$FrontLayerViewModel;

abstract class _FrontLayerBase with Store {
  @observable
  String text = "Carregando...";

  @action
  void onLoadFrontView(String text) {
    this.text = text;
  }
}
