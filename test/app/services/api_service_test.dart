import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:travel_agency_front/app/services/api_service.dart';

void main() {
  ApiService service;

  setUp(() {
    service = ApiService(Dio());
  });

  group('ApiService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<ApiService>());
    });
  });
}
