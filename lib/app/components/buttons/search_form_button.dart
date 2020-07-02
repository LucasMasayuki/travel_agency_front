import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/search_items/view_models/search_item_view_model.dart';
import 'package:travel_agency_front/app/interfaces/category_view_model_inferface.dart';
import 'package:travel_agency_front/app/interfaces/search_view_model_interface.dart';

class SearchFormButton extends StatelessWidget {
  final CategoryViewModelInterface categoryViewModel;
  final SearchViewModelInterface searchViewModel;

  const SearchFormButton({
    Key key,
    @required this.categoryViewModel,
    @required this.searchViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchItemViewModel searchItemViewModel = Modular.get();

    return Observer(builder: (_) {
      return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () {
          if (this.searchViewModel.isValidForm) {
            searchItemViewModel.onSearch(true);

            this.categoryViewModel.loadCategoryData(
                  this.searchViewModel.getSearchData(),
                );
          }
        },
        child: Text('Procurar'),
        color: this.searchViewModel.isValidForm
            ? Colors.orange[400]
            : Colors.grey[400],
        textColor: Colors.white,
      );
    });
  }
}
