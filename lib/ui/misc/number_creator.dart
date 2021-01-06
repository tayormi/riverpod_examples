import 'dart:async';

class NumberCreator {
  NumberCreator() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      controller.sink.add(_count);
      _count++;
    });
  }
  var _count = 1;
  final controller = StreamController<int>();
  Stream<int> get stream => controller.stream;
}
