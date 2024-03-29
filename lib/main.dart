import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_practoce/app/repositories/data_repository.dart';
import 'package:rest_api_practoce/app/services/api.dart';
import 'package:rest_api_practoce/app/services/api_service.dart';
import 'package:rest_api_practoce/app/services/date_cache_service.dart';
import 'package:rest_api_practoce/app/ui/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'ja_JP';
  // Intl.withLocale('ja_JP', () => runApp(MyApp()));
  // await initializeDateFormatting('ja_JP', null);
  await initializeDateFormatting();
  final sharedPreferences = await SharedPreferences.getInstance();
  print(DateTime.now().toIso8601String());
  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.sharedPreferences}) : super(key: key);
  final SharedPreferences sharedPreferences;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(
        apiService: APIService(API.sandbox()),
        dataCacheService:
            DataCacheService(sharedPreferences: sharedPreferences),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF101010),
          cardColor: Color(0xFF22222),
        ),
        home: DashBoard(),
      ),
    );
  }
}
