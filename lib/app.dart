import 'package:flutter/material.dart';

import 'package:oh_prolog/src/pages/route_information/route_information_page.dart';
import 'package:oh_prolog/src/pages/routes_list/routes_list_page.dart';
import 'package:oh_prolog/src/pages/directions/directions_page.dart';
import 'package:oh_prolog/src/pages/consult/consult_page.dart';
 
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'consult',
      routes: <String, WidgetBuilder> {
        'consult': (BuildContext context) => ConsultPage(),
        'directions': (BuildContext context) => DirectionsPage(),
        'routesList': (BuildContext context) => RoutesListPage(),
        'routeInformation': (BuildContext context) => RouteInformationPage()
      },
    );
  }
}