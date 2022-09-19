import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter/material.dart';
import 'package:sampleapidemo/headlines/ui/headlines_feature_widget.dart';
import 'package:sampleapidemo/testapplication_locator.dart';

void main() {
  TestApplicationLocator().api =
      SimpleRestApi(baseUrl: 'https://newsapi.org/', trustSelfSigned: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'News  Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HeadLinesFeatureWidget());
  }
}
