import 'package:flutter/material.dart';

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget? page;
  final Widget? route;
  final RouteSettings? routeSettings;

  ThisIsFadeRoute({this.page, this.route, this.routeSettings})
      : super(
          settings: routeSettings,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}

class SlideTransitionRightToLeft extends PageRouteBuilder {
  final Widget page;
  final RouteSettings? routeSettings;

  SlideTransitionRightToLeft({
    required this.page,
    this.routeSettings,
  }) : super(
          settings: routeSettings,
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn, parent: animation, reverseCurve: Curves.fastOutSlowIn);
            return SlideTransition(
              position: Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0)).animate(animation),
              child: page,
            );
          },
        );
}

class SlideTransitionLeftToRight extends PageRouteBuilder {
  final Widget page;
  final RouteSettings? routeSettings;

  SlideTransitionLeftToRight({
    required this.page,
    this.routeSettings,
  }) : super(
          settings: routeSettings,
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn, parent: animation, reverseCurve: Curves.fastOutSlowIn);
            return SlideTransition(
              position: Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0)).animate(animation),
              textDirection: TextDirection.rtl,
              child: page,
            );
          },
        );
}
