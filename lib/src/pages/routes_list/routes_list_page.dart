import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RoutesListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoutesListPageState();
}

class _RoutesListPageState extends State<RoutesListPage> {

  final _url = 'https://oh-prolog.herokuapp.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutas')
      ),
      body: _getListItems()
    );
  }

  Widget _getListItems() {
    return FutureBuilder(
      future: _getRoutes(),
      initialData: ['Espere por favor...'],
      builder: (context, AsyncSnapshot<List> snapshot) {
        return ListView(
          children: _getItems(snapshot.data, context)
        );
      },
    );
  }

  Future<List> _getRoutes() async {
    var response = await http.get('$_url/consult/routes');
    var decoded = json.decode(response.body);
    print(decoded['routes']);
    return decoded['routes'];
  }

  List<Widget> _getItems(List data, BuildContext context) {
    final List<Widget> items = [];

    data.forEach((route) {
      items.add(ListTile(
        title: Text(route),
        leading: Icon(Icons.directions_bus),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue
        ),
        onTap: () {
          Navigator.pushNamed(context, 'routeInformation', arguments: route);
        },
      ));
      items.add(Divider());
    });

    return items;
  }
}