import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RoutesListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoutesListPageState();
}

class _RoutesListPageState extends State<RoutesListPage> {

  final _url = 'https://oh-prolog.herokuapp.com/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: _getListItems(),
      ),
    );
  }

  List<Widget> _getListItems() {
    getRoutes();
    return [
      ListTile(
        title: Text('Ruta'),
        leading: Icon(Icons.directions_bus),
      )
    ];
  }

  getRoutes() async {
    var response = await http.get('$_url/consult/routes');
    var decoded = json.decode(response.body);
    print(decoded);
  }
}