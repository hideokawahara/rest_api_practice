import 'package:flutter/material.dart';
import 'package:rest_api_practoce/app/services/api.dart';
import 'package:rest_api_practoce/app/ui/endpoint_card.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('コロ助'),
      ),
      body: ListView(
        children: <Widget>[
          EndpointCard(
            endpoint: Endpoint.cases,
            value: 123,
          ),
        ],
      ),
    );
  }
}
