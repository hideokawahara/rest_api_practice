import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rest_api_practoce/app/services/api.dart';

class EndpointCardData {
  EndpointCardData(this.title, this.assetName, this.color);
  final String title;
  final String assetName;
  final Color color;
}

class EndpointCard extends StatelessWidget {
  final Endpoint endpoint;
  final int value;
  static Map<Endpoint, EndpointCardData> _cardsData = {
    Endpoint.cases: EndpointCardData(
      'cases',
      'assets/count.png',
      Color(0xFFFFF492),
    ),
    Endpoint.casesSuspected: EndpointCardData(
      'Suspected',
      'assets/suspect.png',
      Color(0xFFEEDA28),
    ),
    Endpoint.casesConfirmed: EndpointCardData(
      'confirmed',
      'assets/fever.png',
      Color(0xFFE99600),
    ),
    Endpoint.deaths: EndpointCardData(
      'deaths',
      'assets/death.png',
      Color(0xFFE40000),
    ),
    Endpoint.recovered: EndpointCardData(
      'recovered',
      'assets/patient.png',
      Color(0xFF70A901),
    ),
  };

  const EndpointCard({Key key, this.endpoint, this.value}) : super(key: key);

  String get formattedValue {
    if (value == null) {
      return '';
    }
    return NumberFormat('#,###,###,###').format(value);
  }

  @override
  Widget build(BuildContext context) {
    final cardData = _cardsData[endpoint];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                cardData.title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: cardData.color),
              ),
              SizedBox(
                height: 4.0,
              ),
              SizedBox(
                height: 52.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      cardData.assetName,
                      color: cardData.color,
                    ),
                    Text(
                      formattedValue,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: cardData.color, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
