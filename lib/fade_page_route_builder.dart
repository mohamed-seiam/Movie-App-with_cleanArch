import 'package:flutter/cupertino.dart';

class FadePageRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;
  final RouteSettings setting;
  FadePageRouteBuilder(this.builder, this.setting,):super(
    pageBuilder:(context,animation,secondaryAnimation)=>builder(context),
    transitionsBuilder:(context,animation,secondaryAnimation,child){
      var curve = Curves.ease;
      var tween = Tween(begin: 0.0,end: 1.0).chain(CurveTween(curve: curve));
      return FadeTransition(opacity:animation.drive(tween),child: child,);
    },
    transitionDuration: const Duration(milliseconds: 500),
    settings: setting
  );
}