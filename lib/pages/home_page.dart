import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../redux/counter.dart' as counter;

class HomePage extends StatelessWidget {
  final Store<int> store;
  const HomePage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            StoreConnector<int, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(counter.Actions.Increment);
              },
              builder: (context, callback) {
                return FloatingActionButton(
                  onPressed: callback,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                );
              },
            ),
            const SizedBox(height: 10),
            StoreConnector<int, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(counter.Actions.Decrement);
              },
              builder: (context, callback) {
                return FloatingActionButton(
                  onPressed: callback,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                );
              },
            ),
            const SizedBox(height: 10),
            StoreConnector<int, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(counter.Actions.Reset);
              },
              builder: (context, callback) {
                return FloatingActionButton(
                  onPressed: callback,
                  tooltip: 'Reset',
                  child: const Icon(Icons.exposure_zero),
                );
              },
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(
            child: StoreConnector<int, String>(
          converter: (store) => store.state.toString(),
          builder: (context, count) {
            return Text(
              count,
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            );
          },
        )),
      ),
    );
  }
}
