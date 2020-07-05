import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:travel_agency_front/app/components/item_card/item_card_widget.dart';

main() {
  testWidgets('ItemCardWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ItemCardWidget()));
    final textFinder = find.text('ItemCard');
    expect(textFinder, findsOneWidget);
  });
}
