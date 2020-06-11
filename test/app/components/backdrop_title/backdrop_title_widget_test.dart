import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:travel_agency_front/app/components/backdrop_title/backdrop_title_widget.dart';

main() {
  testWidgets('BackdropTitleWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(BackdropTitleWidget()));
    final textFinder = find.text('BackdropTitle');
    expect(textFinder, findsOneWidget);
  });
}
