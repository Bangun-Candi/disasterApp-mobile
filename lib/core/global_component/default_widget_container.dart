import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:merchant_app/core/global_component/vcustom_appbar.dart';
import 'package:merchant_app/core/global_component/vdefault_screen_loading.dart';
import 'package:merchant_app/core/utils/cconstant.dart';

class DefaultWidgetContainer extends StatelessWidget {
  const DefaultWidgetContainer({
    super.key,
    this.appBar,
    required this.body,
    this.canPop = true,
    this.onPopInvoked,
    this.resizeToAvoidBottomInset,
    this.scrollController,
    this.scrollPhysics,
    this.actvateScroll = false,
    this.floatingActionButton,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawerScrimColor,
    this.endDrawer,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.primary = true,
    this.persistentFooterButtons,
    this.restorationId,
    this.scaffoldKey,
    this.titleAppBar,
    this.isLoading,
    this.noUseAppBar = false,
    this.createCustomBody = false,
  });
  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool? canPop;
  final Function(bool)? onPopInvoked;
  final bool? resizeToAvoidBottomInset;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final bool? actvateScroll;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final DragStartBehavior drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final Color? drawerScrimColor;
  final Widget? endDrawer;
  final bool endDrawerEnableOpenDragGesture;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Function(bool)? onDrawerChanged;
  final Function(bool)? onEndDrawerChanged;
  final AlignmentDirectional persistentFooterAlignment;
  final List<Widget>? persistentFooterButtons;
  final bool primary;
  final String? restorationId;
  final String? titleAppBar;
  final bool? isLoading;
  final bool? noUseAppBar;
  final bool? createCustomBody;
  final Key? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      canPop: canPop ?? true,
      onPopInvoked: onPopInvoked,
      body: createCustomBody ?? false
          ? body
          : Stack(
              children: [
                noUseAppBar ?? false
                    ? const SizedBox()
                    : VcustomAppbar(
                        titleAppBar: titleAppBar,
                      ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 27,
                    right: 27,
                    top: Cconstant.getFullHeight(context) * 0.12,
                  ),
                  child: body,
                ),
                isLoading ?? false
                    ? const VdefaultScreenLoading()
                    : const SizedBox()
              ],
            ),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
      floatingActionButton: floatingActionButton,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      drawer: drawer,
      drawerDragStartBehavior: drawerDragStartBehavior,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      drawerScrimColor: drawerScrimColor,
      endDrawer: endDrawer,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      floatingActionButtonLocation: floatingActionButtonLocation,
      onDrawerChanged: onDrawerChanged,
      onEndDrawerChanged: onEndDrawerChanged,
      persistentFooterAlignment: persistentFooterAlignment,
      persistentFooterButtons: persistentFooterButtons,
      primary: primary,
      restorationId: restorationId,
      key: scaffoldKey,
    );
  }
}
