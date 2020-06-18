import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:travel_agency_front/app/components/search_form/search_form_controller.dart';
import 'package:travel_agency_front/app/app_module.dart';

void main() {
  initModule(AppModule());
  SearchFormController searchform;

  setUp(() {
    searchform = AppModule.to.get<SearchFormController>();
  });

  group('SearchFormController Test', () {
    test("First Test", () {
      expect(searchform, isInstanceOf<SearchFormController>());
    });

    test("Set Value", () {
      expect(searchform.value, equals(0));
      searchform.increment();
      expect(searchform.value, equals(1));
    });
  });
}
