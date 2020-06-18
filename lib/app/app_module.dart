import 'package:travel_agency_front/app/components/search_form/search_form_controller.dart';
import 'package:travel_agency_front/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:travel_agency_front/app/app_widget.dart';
import 'package:travel_agency_front/app/components/backdrop/backdrop_controller.dart';
import 'package:travel_agency_front/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SearchFormController()),
        Bind((i) => AppController()),
        Bind((i) => BackdropController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
