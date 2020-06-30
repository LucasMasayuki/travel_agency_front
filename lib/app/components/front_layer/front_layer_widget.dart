import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:travel_agency_front/app/components/front_layer/front_layer_view_model.dart';

class FrontLayerWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const FrontLayerWidget({
    Key key,
    this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FrontLayerViewModel frontLayerViewModel = Modular.get();

    return Observer(builder: (_) {
      return Material(
        elevation: 16.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: Container(
                height: 40.0,
                alignment: AlignmentDirectional.centerStart,
                child: Align(
                  alignment: Alignment.center,
                  child: frontLayerViewModel.clickableWidget,
                ),
              ),
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      );
    });
  }
}
