import 'package:mobx/mobx.dart';

part 'cart_view_model.g.dart';

class CartViewModel = _CartViewModelBase with _$CartViewModel;

abstract class _CartViewModelBase with Store {
  @observable
  dynamic item;

  @action
  onAddItemOnCart(item) {
    this.item = item;
  }
}
