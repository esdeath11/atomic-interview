// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobilepocketapp/data/arguments/detail_argument_dompet.dart';
import 'package:mobilepocketapp/etc/slicing/detail_slicing_view.dart';
import 'package:mobilepocketapp/etc/slicing/form_slicing_view.dart';
import 'package:mobilepocketapp/module/dashboard/dashboard_screen.dart';

Route? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DetailSlicingView.routeName:
      final arguments = settings.arguments as DetailDompetArguments?;
      return MaterialPageRoute(
          builder: (_) => DetailSlicingView(arguments: arguments));
    case FormSlicingView.routeName:
      final arguments = settings.arguments as DetailDompetArguments?;
      return MaterialPageRoute(
          builder: (_) => FormSlicingView(
                arguments: arguments,
              ));

    default:
      return MaterialPageRoute(builder: (_) => DashboardScreen());
  }
}
