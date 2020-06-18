import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:travel_agency_front/app/components/search_form/search_form_widget.dart';

main() {
  testWidgets('SearchFormWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(SearchFormWidget()));
    final textFinder = find.text('SearchForm');
    expect(textFinder, findsOneWidget);
  });
}
