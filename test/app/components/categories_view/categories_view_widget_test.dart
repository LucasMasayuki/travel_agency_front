import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:travel_agency_front/app/components/categories_view/categories_view_widget.dart';

main() {
  testWidgets('CategoriesViewWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(CategoriesViewWidget()));
    final textFinder = find.text('CategoriesView');
    expect(textFinder, findsOneWidget);
  });
}
