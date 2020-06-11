import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:travel_agency_front/app/components/front_layer/front_layer_widget.dart';

main() {
  testWidgets('FrontLayerWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(FrontLayerWidget()));
    final textFinder = find.text('FrontLayer');
    expect(textFinder, findsOneWidget);
  });
}
