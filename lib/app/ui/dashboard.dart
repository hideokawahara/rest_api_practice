import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_practoce/app/repositories/data_repository.dart';
import 'package:rest_api_practoce/app/repositories/endpoints_data.dart';
import 'package:rest_api_practoce/app/services/api.dart';
import 'package:rest_api_practoce/app/ui/endpoint_card.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  EndpointsData _endpointsData;

  @override
  void initState() {
    print('here!');
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final endpointsData = await dataRepository.getAllEndpointsData();
    setState(() => _endpointsData = endpointsData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('コロ助'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: <Widget>[
            for (var endpoint in Endpoint.values)
              EndpointCard(
                endpoint: endpoint,
                value: _endpointsData != null
                    ? _endpointsData.values[endpoint]
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}
