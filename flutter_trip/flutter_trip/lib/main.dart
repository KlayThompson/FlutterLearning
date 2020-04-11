import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/navigator/tab_navigator.dart';
import 'package:flutter_trip/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_trip/routes/routes.dart';

void main() {
  var homeProvider = HomeProvider();
  final router = Router();
  Routes.configureRoutes(router);
  Routes.router = router;
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: homeProvider)
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Routes.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabNavigatorPage(),
    );
  }
}
