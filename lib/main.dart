import 'package:demo_app/pages/invoice.dart';
import 'package:demo_app/pages/item_selection.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: Invoice.routeName,
      routes: {
        Invoice.routeName: (context) => Invoice(),
        ItemSelection.routeName: (context) => ItemSelection(),
      },
    );
  }
}
