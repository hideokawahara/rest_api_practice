import 'package:flutter/material.dart';
import 'package:rest_api_practoce/app/services/api.dart';

class EndpointCard extends StatelessWidget {
  final Endpoint endpoint;
  final int value;
  static Map<Endpoint, String> _cardTitles = {
    Endpoint.cases: 'Cases',
    Endpoint.casesSuspected: 'Suspected',
    Endpoint.casesConfirmed: 'Confirmed',
    Endpoint.deaths: 'Deaths',
    Endpoint.recovered: 'Recovered',
  };

  const EndpointCard({Key key, this.endpoint, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _cardTitles[endpoint],
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                value != null ? value.toString() : '',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
