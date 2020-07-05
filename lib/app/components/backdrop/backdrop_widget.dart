import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:travel_agency_front/app/components/backdrop_title/backdrop_title_widget.dart';
import 'package:travel_agency_front/app/components/buttons/dialog_confirm_button.dart';
import 'package:travel_agency_front/app/components/categories_view/view_model/categories_view_model.dart';
import 'package:travel_agency_front/app/components/dialogs/view_model/send_email_dialog_view_model.dart';
import 'package:travel_agency_front/app/components/front_layer/front_layer_widget.dart';
import 'package:travel_agency_front/app/components/inputs/text_form_field_custom.dart';
import 'package:travel_agency_front/app/components/search_items/view_models/search_item_view_model.dart';

const double _kFlingVelocity = 2.0;

class BackdropWidget extends StatefulWidget {
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;
  final tabIcons;

  const BackdropWidget({
    @required this.frontLayer,
    @required this.backLayer,
    @required this.frontTitle,
    @required this.backTitle,
    @required this.tabIcons,
  });

  @override
  _BackdropWidgetState createState() => new _BackdropWidgetState();
}

class _BackdropWidgetState extends State<BackdropWidget>
    with TickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  final CategoriesViewModel categoriesViewModel = Modular.get();
  final SearchItemViewModel searchItemViewModel = Modular.get();
  AnimationController _controller;
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    reaction(
      (_) => Observable(searchItemViewModel.isSearching),
      (isSearching) => isSearching ? _toggleBackdropLayerVisibility() : null,
    );

    _tabController = TabController(vsync: this, length: widget.tabIcons.length);
    _tabController.addListener(_handleTabSelection);

    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      categoriesViewModel.onChangeView(_tabController.index);
    }
  }

  bool get _frontLayerVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBackdropLayerVisibility() {
    _controller.fling(
      velocity: _frontLayerVisible ? -_kFlingVelocity : _kFlingVelocity,
    );
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double layerTitleHeight = 48.0;
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTitleHeight;

    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
          0.0, layerTop, 0.0, layerTop - layerSize.height),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_controller.view);

    return Stack(
      key: _backdropKey,
      children: <Widget>[
        ExcludeSemantics(
          child: widget.backLayer,
          excluding: _frontLayerVisible,
        ),
        PositionedTransition(
          rect: layerAnimation,
          child: FrontLayerWidget(
            onTap: _toggleBackdropLayerVisibility,
            child: widget.frontLayer,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      elevation: 0.0,
      title: BackdropTitleWidget(
        listenable: _controller.view,
        onPress: _toggleBackdropLayerVisibility,
        frontTitle: widget.frontTitle,
        backTitle: widget.backTitle,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(48.0),
        child: Container(
          margin: EdgeInsets.only(bottom: 6, top: 6),
          child: TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white, width: 3),
            ),
            tabs: widget.tabIcons,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SendEmailDialogViewModel sendEmailDialogViewModel = Modular.get();
          showDialog<String>(
            context: context,
            barrierDismissible:
                false, // dialog is dismissible with a tap on the barrier
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Quer receber emails com as melhores promoções ? coloque seu email e confirme',
                ),
                content: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormFieldCustom(
                        contentPadding: EdgeInsets.all(0),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: sendEmailDialogViewModel.onChangeEmail,
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  DialogConfirmButton(
                    color: Colors.grey,
                    text: "Não, obrigado",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  DialogConfirmButton(
                    color: Colors.indigo,
                    text: "Sim, eu quero",
                    onPressed: () {
                      sendEmailDialogViewModel.sendEmail();
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            },
          );
        },
        child: Icon(Icons.notifications),
      ),
      body: LayoutBuilder(
        builder: _buildStack,
      ),
    );
  }
}
