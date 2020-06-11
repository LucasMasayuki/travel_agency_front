import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:travel_agency_front/app/components/backdrop/backdrop_widget.dart';

main() {
  testWidgets('BackdropWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(BackdropWidget()));
    final textFinder = find.text('Backdrop');
    expect(textFinder, findsOneWidget);
  });
}
