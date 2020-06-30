import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'front_layer_view_model.g.dart';

class FrontLayerViewModel = _FrontLayerBase with _$FrontLayerViewModel;

abstract class _FrontLayerBase with Store {
  @observable
  Widget clickableWidget = Text("Carregando...");

  @action
  void onLoadFrontView(clickableWidget) {
    clickableWidget = clickableWidget;
  }
}
