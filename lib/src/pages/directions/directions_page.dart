import 'package:flutter/material.dart';
 
class DirectionsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indicaciones')
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                _origin(),
                _destination(),
                Divider(),
                _submitButton(),
              ]),
              Text('Rutas'),
              ListTile(
                title: Text('Algo'),
                leading: Icon(Icons.directions_bus),
              )
            ],
          )
        ),
      ),
    );
  }

  Widget _origin() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Lugar origen'
      ),
    );
  }

  Widget _destination() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Lugar destino'
      ),
    );
  }

  Widget _submitButton() {
    return FlatButton(
      child: Text('Buscar', style: TextStyle(color: Colors.white)),
      color: Colors.blue,
      onPressed: () {},
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
}