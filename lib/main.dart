// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobilepocketapp/common/routes.dart';
import 'package:mobilepocketapp/data/local_data/local_data_list.dart';
import 'package:provider/provider.dart';

import 'module/dashboard/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<LocalDataList>(
        create: (BuildContext context) => LocalDataList.instance,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardScreen.routeName,
    );
  }
}
