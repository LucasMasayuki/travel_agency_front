import 'package:mobx/mobx.dart';

part 'cart_view_model.g.dart';

class CartViewModel = _CartViewModelBase with _$CartViewModel;

abstract class _CartViewModelBase with Store {
  @observable
  List<dynamic> items = [];

  @observable
  int numberOfItems = 0;

  @action
  onAddItemOnCart(item) {
    this.items.add(item);
    this.numberOfItems += 1;
  }
}
