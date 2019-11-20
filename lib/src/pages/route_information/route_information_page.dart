import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
class RouteInformationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RouteInformationPageState();
}

class _RouteInformationPageState extends State<RouteInformationPage> {
  
  final _url = 'https://oh-prolog.herokuapp.com';
  String _routeName;

  @override
  Widget build(BuildContext context) {
    _routeName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(_routeName)
      ),
      body: _futureBuilder(),
    );
  }

  Future<List> _getBusStops() async {
    final response = await http.get('$_url/consult/route-info?route=$_routeName');
    
    return json.decode(response.body)['stops'];
  }

  Widget _futureBuilder() {
    return FutureBuilder(
      future: _getBusStops(),
      initialData: ['Espere por favor...'],
      builder: (context, AsyncSnapshot<List> snapshot) {
        return ListView(children: _getBuilderItems(snapshot.data, context));
      }
    );
  }

  List<Widget> _getBuilderItems(List data, BuildContext context) {
    final List<Widget> items = [];

    data.forEach((route) {
      items.add(ListTile(
        title: Text(route),
        leading: Icon(Icons.directions_bus),
        onTap: () {},
      ));
      items.add(Divider());
    });

    if (items.length == 0) {
      return [ListTile(
        title: Text('No se encontró ningún resultado'),
        leading: Icon(Icons.warning),
        onTap: () {},
      )];
    }
    return items;
  }
}