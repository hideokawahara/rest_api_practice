import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_practoce/app/repositories/data_repository.dart';
import 'package:rest_api_practoce/app/repositories/endpoints_data.dart';
import 'package:rest_api_practoce/app/services/api.dart';
import 'package:rest_api_practoce/app/ui/endpoint_card.dart';
import 'package:rest_api_practoce/app/ui/last_updated_status_text.dart';
import 'package:rest_api_practoce/app/ui/show_alert_dialog.dart';

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
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    _endpointsData = dataRepository.getAllEndpointsCachedData();
    _updateData();
  }

  Future<void> _updateData() async {
    try {
      final dataRepository =
          Provider.of<DataRepository>(context, listen: false);
      final endpointsData = await dataRepository.getAllEndpointsData();
      setState(() => _endpointsData = endpointsData);
    } on SocketException catch (_) {
      showAlertDialog(
          context: context,
          title: '通信エラー',
          content: 'データが受信できません',
          defaultActionText: 'OK');
    } catch (_) {
      showAlertDialog(
          context: context,
          title: '不明なエラー',
          content: 'よくわかりません',
          defaultActionText: 'OK');
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = LastUpdatedDateFormatter(
      lastUpdated: _endpointsData != null
          ? _endpointsData.values[Endpoint.cases].date
          : null,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('コロ助'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: <Widget>[
            LastUpdatedStatusText(
              text: formatter.lastUpdatedStatusText(),
            ),
            for (var endpoint in Endpoint.values)
              EndpointCard(
                endpoint: endpoint,
                value: _endpointsData != null
                    ? _endpointsData.values[endpoint].value
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}
