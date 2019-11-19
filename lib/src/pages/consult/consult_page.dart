import 'package:flutter/material.dart';

class ConsultPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConsultPageState();
}

class _ConsultPageState extends State<ConsultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consultar')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: _getListItems()
      ),
    );
  }

  List<Widget> _getListItems() {
    return [
      Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          child: ListTile(
            title: Text('Rutas'),
            leading: Icon(Icons.directions_bus),
            // trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pushNamed(context, 'routesList');
            }),
        ),
      ),
      Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          child: ListTile(
            title: Text('Indicaciones'),
            leading: Icon(Icons.directions),
            // trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pushNamed(context, 'directions');
            }),
        ),
      ),
    ];
  }
}
