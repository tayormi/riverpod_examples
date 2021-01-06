import 'package:flutter/material.dart';
import 'package:riverpod_examples/ui/widgets/change_notifier.dart';
import 'package:riverpod_examples/ui/widgets/future_provider.dart';
import 'package:riverpod_examples/ui/widgets/provider.dart';
import 'package:riverpod_examples/ui/widgets/state_notifier.dart';
import 'package:riverpod_examples/ui/widgets/state_provider.dart';
import 'package:riverpod_examples/ui/widgets/stream_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Examples'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Providers',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
                height: 60,
                color: Colors.green,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HelloScreen())),
                child: Center(
                  child: Text(
                    'Provider',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            FlatButton(
                height: 60,
                color: Colors.red,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StateProviderScreen())),
                child: Center(
                  child: Text(
                    'State Provider',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            FlatButton(
                height: 60,
                color: Colors.lightBlue,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StreamProviderScreen())),
                child: Center(
                  child: Text(
                    'Stream Provider',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            FlatButton(
                height: 60,
                color: Colors.orange,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FutureProviderScreen())),
                child: Center(
                  child: Text(
                    'Future Provider',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            Text(
              'Notifiers',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
                height: 60,
                color: Colors.brown,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeNotifierScreen())),
                child: Center(
                  child: Text(
                    'Change Notifier Provider',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            FlatButton(
                height: 60,
                color: Colors.teal,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StateNotifierScreen())),
                child: Center(
                  child: Text(
                    'State Notifier Provider',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
