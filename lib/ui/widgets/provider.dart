import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final helloWorldProvider =
    Provider<String>((ref) => "Hello World. This is new!");

class HelloScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final text = watch(helloWorldProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Container(
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
