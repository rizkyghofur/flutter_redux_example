import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'pages/home_page.dart';
import 'redux/counter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Store<int>(counterReducer, initialState: 0);

    return MaterialApp(
      home: HomePage(
        store: store,
      ),
    );
  }
}
