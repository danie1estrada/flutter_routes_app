import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DirectionsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {

  final _url = 'https://oh-prolog.herokuapp.com';
  final formKey = GlobalKey<FormState>();
  Future<List<dynamic>> _availableRoutes;
  String _origin = '';
  String _destination = '';

  @override
  void initState() {
    super.initState();
    _availableRoutes = _getAvailableRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Indicaciones')),
      body: Container(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: <Widget>[
            _createForm(),
            Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Container(
              child: Row(
                children: <Widget>[
                  Text('Rutas disponibles:', style: TextStyle(fontSize: 20, color: Colors.grey[600])),
                ]
              ),
            )
          ),
          Expanded(child: Container(child: _futureBuilder()))
          ],
        )
      ),
    );
  }

  Widget _createForm() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          _originTF(),
          _destinationTF(),
          Divider(),
          _submitButton(),
        ],
      ),
    );
  }

  Widget _createBody() {
    return Column(
      children: <Widget>[
        
      ],
    );
  }

  Widget _originTF() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Lugar origen'),
      onSaved: (value) => _origin = value,
    );
  }

  Widget _destinationTF() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Lugar destino'),
      onSaved: (value) => _destination = value,
    );
  }

  Widget _submitButton() {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        child: Text('Consultar', style: TextStyle(color: Colors.white)),
        color: Colors.blue,
        onPressed: () {
          formKey.currentState.save();
          print('$_origin to $_destination');
          setState(() {
            _availableRoutes = _getAvailableRoutes();
          });
        },
      )
    );
  }

  Widget _listView() {
    final List<Widget> l = [];
    for (var i = 0; i < 15; i++) {
      l.add(ListTile(
        title: Text('# $i'),
        leading: Icon(Icons.directions_bus),
      ));
      l.add(Divider());
    }

    return ListView(children: l);
  }

  Future<List> _getAvailableRoutes() async {
    final response = await http.get('$_url/consult/directions?origin=$_origin&destination=$_destination');
    return json.decode(response.body)['availableRoutes'];
  }

  Widget _futureBuilder() {
    return FutureBuilder(
      future: _availableRoutes,
      initialData: [],
      builder: (context, AsyncSnapshot<List> snapshot) {
        return ListView(children: _getBuilderItems(snapshot.data, context));
      },
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
