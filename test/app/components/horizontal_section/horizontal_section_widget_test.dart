import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:travel_agency_front/app/components/horizontal_section/horizontal_section_widget.dart';

main() {
  testWidgets('HorizontalSectionWidget has message',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HorizontalSectionWidget()));
    final textFinder = find.text('HorizontalSection');
    expect(textFinder, findsOneWidget);
  });
}
